#!/usr/bin/env python3
"""Sestavi TS v PDF (pandoc + XeLaTeX, A4).

Pripravi začasno kopijo poglavij, v kateri so širine stolpcev tabel nastavljene
po povprečni dolžini vsebine (pandoc sicer vse stolpce razdeli enakomerno),
nato zažene pandoc. Izhod: build/TS_eFTI-Gate_SI.pdf
Uporaba: scripts/build-pdf.py [--status "Osnutek v0.2"]
Potrebno: pandoc, xelatex, pisavi Arial in Menlo; za bloke ```mermaid še mmdc
(@mermaid-js/mermaid-cli) – brez njega ostanejo bloki kot koda.
"""
import datetime
import pathlib
import re
import shutil
import subprocess
import sys
import tempfile

ROOT = pathlib.Path(__file__).resolve().parent.parent
TS = ROOT / "docs" / "ts"
OUT = ROOT / "build" / "TS_eFTI-Gate_SI.pdf"
STATUS = sys.argv[sys.argv.index("--status") + 1] if "--status" in sys.argv else "Delovni osnutek"

HEADER = r"""
\usepackage{etoolbox}
\AtBeginEnvironment{longtable}{\footnotesize}
\usepackage{xurl}
\usepackage{pdflscape}
\newcommand{\lsbegin}{\begin{landscape}}
\newcommand{\lsend}{\end{landscape}}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small eFTI Gate (SI) – tehnične specifikacije}
\fancyhead[R]{\small %s}
\fancyfoot[C]{\small\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\setlength{\emergencystretch}{3em}
\sloppy
""" % STATUS.replace("%", r"\%")


def widths(table_lines, chars=100):
    """Nastavi ločilno vrstico tabele (|---|---|) po povprečni dolžini celic."""
    rows = [[c.strip() for c in l.strip().strip("|").split("|")] for l in table_lines if not re.match(r"^\|\s*:?-", l)]
    body = rows[1:] or rows
    n = max(len(r) for r in rows)
    avg, minfrac = [], []
    for i in range(n):
        cells = [r[i] for r in rows if i < len(r)]
        lens = [len(c) for c in cells]
        avg.append(sum(lens) / len(lens) if lens else 1)
        # najdaljša nedeljiva beseda (npr. SI-GATE-NFR-305) mora ostati v eni vrstici;
        # ~115 znakov v vrstici pri \footnotesize na A4 z robovi 2 cm
        def eff(w):  # velike črke in števke so širše
            return sum(1.35 if ch.isupper() or ch.isdigit() else 1.0 for ch in w)
        bcells = [r[i] for r in body if i < len(r)]  # glava se lahko deli
        words = [w for c in bcells for w in re.split(r"\s+", re.sub(r"[*`]|\\mbox\{|\}", "", c)) if w]
        head = rows[0][i] if i < len(rows[0]) else ""
        hlong = max((min(eff(w), 8) for w in head.split()), default=0)  # glava: daljše besede se delijo
        longest = max([eff(w) for w in words] + [hlong, 3])
        minfrac.append((min(longest, 17) + 2) / chars)
    # najprej najmanjše širine, preostanek po povprečni dolžini vsebine
    total = sum(avg) or 1
    base = sum(minfrac)
    if base >= 1:
        frac = [m / base for m in minfrac]
    else:
        frac = [m + (1 - base) * a / total for m, a in zip(minfrac, avg)]
    dashes = [max(2, round(200 * f)) for f in frac]
    return "|" + "|".join("-" * d for d in dashes) + "|"


def prep(text, landscape=False, chars=None):
    lines = text.split("\n")
    out, i = [], 0
    while i < len(lines):
        if lines[i].startswith("|") and i + 1 < len(lines) and re.match(r"^\|\s*:?-{3,}", lines[i + 1]):
            j = i
            while j < len(lines) and lines[j].startswith("|"):
                j += 1
            block = lines[i:j]
            block[1] = widths(block, chars=chars or (150 if landscape else 100))
            out += (["", "\\lsbegin", ""] + block + ["", "\\lsend", ""]) if landscape else block
            i = j
        else:
            out.append(lines[i])
            i += 1
    return "\n".join(out)


MMDC_CFG = pathlib.Path.home() / ".config" / "mermaid" / "puppeteer-config.json"


def mermaid(text, outdir, stem):
    """Bloke ```mermaid upodobi v vektorski PDF (mmdc) in jih nadomesti s sliko.
    (SVG iz mermaid ima besedilo v foreignObject, ki ga rsvg-convert izpusti.)"""
    if not shutil.which("mmdc"):
        return text
    n = 0

    def render(m):
        nonlocal n
        n += 1
        src = outdir / f"{stem}-mermaid-{n}.mmd"
        png = outdir / f"{stem}-mermaid-{n}.pdf"
        src.write_text(m.group(1))
        cmd = ["mmdc", "-i", str(src), "-o", str(png)]
        if MMDC_CFG.exists():
            cmd += ["-p", str(MMDC_CFG)]
        r = subprocess.run(cmd, capture_output=True, text=True)
        if r.returncode != 0 or not png.exists():
            print("mmdc ni uspel:", r.stderr[-500:], file=sys.stderr)
            return m.group(0)
        return f"![]({png.name})"

    return re.sub(r"```mermaid\n(.*?)\n```", render, text, flags=re.S)


def main():
    files = [TS / "README.md"] + sorted(TS.glob("[01][0-9]-*.md")) + sorted(TS.glob("priloga-*.md"))
    with tempfile.TemporaryDirectory() as tmp:
        tmpd = pathlib.Path(tmp) / "docs" / "ts"
        tmpd.mkdir(parents=True)
        shutil.copytree(ROOT / "architecture", pathlib.Path(tmp) / "architecture")
        # diagrami C4 kot SVG (vektorsko, manjše); pandoc jih z rsvg-convert pretvori v PDF
        svg = bool(shutil.which("plantuml") and shutil.which("rsvg-convert"))
        if svg:
            dd = pathlib.Path(tmp) / "architecture" / "diagrams"
            r = subprocess.run(["plantuml", "-tsvg", *map(str, dd.glob("*.puml"))], capture_output=True, text=True)
            svg = r.returncode == 0
        srcs = []
        for f in files:
            t = f.read_text()
            if f.name == "README.md":
                t = re.sub(r"^# .*\n", "", t, count=1)          # naslov gre na naslovnico
                t = re.sub(r"\n## Kazalo\n.*", "\n", t, flags=re.S)  # kazalo ustvari LaTeX
            t = re.sub(r"(?<![\w`])(SI-GATE-(?:FR|NFR)-\d{3})(?![\w`])", r"\\mbox{\1}", t)  # oznake se ne lomijo
            t = mermaid(t, tmpd, f.stem)
            if svg:
                t = re.sub(r"(architecture/diagrams/structurizr-[\w-]+)\.png\)", r"\1.svg)", t)
            if f.name == "priloga-e-openapi.md":  # cela priloga ležeče (več tabel)
                t = "\n\\lsbegin\n\n" + prep(t, chars=150) + "\n\n\\lsend\n"
            else:
                t = prep(t, landscape=f.name == "priloga-c-sledljivost.md")
            (tmpd / f.name).write_text(t)
            srcs.append(str(tmpd / f.name))
        (pathlib.Path(tmp) / "header.tex").write_text(HEADER)
        OUT.parent.mkdir(exist_ok=True)
        cmd = [
            "pandoc", *srcs,
            "--from", "markdown-yaml_metadata_block-implicit_figures", "--columns", "72", "--pdf-engine", "xelatex",
            "--resource-path", f"{tmpd}:{tmp}",
            "--toc", "--toc-depth=2", "--number-sections=false",
            "-H", str(pathlib.Path(tmp) / "header.tex"),
            "-V", "papersize=a4", "-V", "geometry:margin=2cm", "-V", "lang=sl",
            "-V", "mainfont=Arial", "-V", "monofont=Menlo", "-V", "fontsize=10pt",
            "-V", "colorlinks=true", "-V", "linkcolor=blue", "-V", "urlcolor=blue",
            "-M", "title=Tehnične specifikacije za vzpostavitev slovenskega eFTI Gate",
            "-M", "subtitle=Projektna naloga za implementacijo Uredbe eFTI v Sloveniji (mejnik M3)",
            "-M", f"date={STATUS}, {datetime.date.today().strftime('%d. %m. %Y').lstrip('0').replace(' 0', ' ')}",
            "-o", str(OUT),
        ]
        r = subprocess.run(cmd, capture_output=True, text=True)
        missing = sorted(set(re.findall(r"Missing character: There is no (.) ", r.stderr)))
        if r.returncode != 0:
            print(r.stderr[-3000:], file=sys.stderr)
            return r.returncode
        if missing:
            print("Manjkajoči znaki v pisavi:", " ".join(missing), file=sys.stderr)
    print(OUT.relative_to(ROOT))
    return 0


if __name__ == "__main__":
    sys.exit(main())
