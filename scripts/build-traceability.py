#!/usr/bin/env python3
"""Sestavi Prilogo C (matrika sledljivosti) iz tabel zahtev v docs/ts/*.md.

Vrstica zahteve: | SI-GATE-(FR|NFR)-NNN | opis | vir | P | Komp. | Preverjanje |
Preveri podvojene oznake in sklice na neobstoječe oznake; ob napaki konča s kodo 1.
Uporaba: scripts/build-traceability.py [--check]   (--check: le preveri, ne piše)
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
TS = ROOT / "docs" / "ts"
OUT = TS / "priloga-c-sledljivost.md"
ROW = re.compile(r"^\|\s*(SI-GATE-(?:FR|NFR)-\d{3})\s*\|(.*)\|\s*$")
REF = re.compile(r"SI-GATE-(?:FR|NFR)-\d{3}")


def cells(rest):
    return [c.strip() for c in rest.split("|")]


def main():
    check_only = "--check" in sys.argv
    reqs, errors, refs = {}, [], []
    for md in sorted(TS.glob("[0-9][0-9]-*.md")):
        chapter = md.name.split("-")[0].lstrip("0") or "0"
        for n, line in enumerate(md.read_text().splitlines(), 1):
            m = ROW.match(line)
            if m:
                rid, c = m.group(1), cells(m.group(2))
                if len(c) != 5:
                    errors.append(f"{md.name}:{n} {rid}: pričakovanih 6 stolpcev, najdenih {len(c) + 1}")
                    continue
                if rid in reqs:
                    errors.append(f"{md.name}:{n} {rid}: podvojena oznaka (prej v pogl. {reqs[rid]['pogl']})")
                reqs[rid] = dict(opis=c[0], vir=c[1], p=c[2], komp=c[3], prev=c[4], pogl=chapter)
                refs += [(md.name, n, r) for r in REF.findall(c[0]) if r != rid]
            else:
                refs += [(md.name, n, r) for r in REF.findall(line)]
    for f, n, r in refs:
        if r not in reqs:
            errors.append(f"{f}:{n}: sklic na neobstoječo oznako {r}")

    for e in errors:
        print("NAPAKA:", e, file=sys.stderr)
    stats = {}
    for r in reqs.values():
        stats[r["p"]] = stats.get(r["p"], 0) + 1
    print(f"{len(reqs)} zahtev; po prioriteti: {stats}", file=sys.stderr)
    if check_only:
        return 1 if errors else 0

    def short(s, k=110):
        s = re.sub(r"\s+", " ", s)
        return s if len(s) <= k else s[: k - 1].rsplit(" ", 1)[0] + " …"

    def key(rid):
        kind, num = rid.split("-")[2:]
        return (kind, int(num))

    lines = [
        "# Priloga C: Matrika sledljivosti zahtev (oznaka zahteve, vir, preverjanje)",
        "",
        "> **Generirano** s `scripts/build-traceability.py` iz tabel zahtev v poglavjih; ne urejaj ročno.",
        ">",
        f"> Število zahtev: {len(reqs)}. Pomen stolpcev P, Komp. in Preverjanje: pogl. 6.0.",
        "",
        "| Oznaka | Kratek opis | Vir | P | Komp. | Preverjanje | Pogl. |",
        "|---|---|---|---|---|---|---|",
    ]
    for rid in sorted(reqs, key=key):
        r = reqs[rid]
        lines.append(f"| {rid} | {short(r['opis'])} | {r['vir']} | {r['p']} | {r['komp']} | {r['prev']} | {r['pogl']} |")
    OUT.write_text("\n".join(lines) + "\n")
    print(f"zapisano: {OUT.relative_to(ROOT)}", file=sys.stderr)
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
