#!/usr/bin/env python3
"""Sestavi Prilogo E (storitve OpenAPI) iz interfaces/openapi/*.yaml.

Uporaba: scripts/build-api-docs.py [--check]   (--check: le preveri, ali je priloga osvežena)
Potrebno: PyYAML.
"""
import pathlib
import sys

import yaml

ROOT = pathlib.Path(__file__).resolve().parent.parent
SPECS = ROOT / "interfaces" / "openapi"
OUT = ROOT / "docs" / "ts" / "priloga-e-openapi.md"
METHODS = ["get", "post", "put", "patch", "delete"]

# metapodatki storitev, ki niso v samih specifikacijah (vmesnik, odjemalci, izdaja, element C4)
META = {
    "efti-gate-aap-api.yaml": ("#3 G2A", "AAP pristojnih organov", "R1", "vrata.caApi"),
    "efti-gate-admin-api.yaml": ("upravljanje", "upravljavska aplikacija, avtomatizacija MZIE", "R1 (sinhronizacija statusov R2)", "vrata.adminApi"),
    "efti-gate-audit-api.yaml": ("revizija, poročanje", "upravljavska aplikacija, poročanje MZIE", "R1", "vrata.auditApi"),
    "efti-authorisation-registry-api.yaml": ("Authorisation Registry", "kadrovski sistemi pristojnih organov", "R2, pogojno (M2)", "vrata.arApi"),
}


def security(doc):
    names = []
    for req in doc.get("security", []):
        names += list(req)
    schemes = doc.get("components", {}).get("securitySchemes", {})
    out = []
    for n in names:
        s = schemes.get(n, {})
        t = s.get("type")
        out.append({"mutualTLS": "mTLS", "oauth2": "OAuth 2.0 (client credentials)", "openIdConnect": "OpenID Connect"}.get(t, t))
    return " + ".join(out)


def build():
    lines = [
        "# Priloga E: Storitve OpenAPI",
        "",
        "> **Generirano** s `scripts/build-api-docs.py` iz `interfaces/openapi/*.yaml`; ne urejaj ročno. Specifikacije so osnutki in del TS (pogl. 7.9); pri razlikah velja datoteka YAML.",
        "",
        "## E.0 Pregled storitev",
        "",
        "| Storitev | Datoteka | Različica | Vmesnik | Odjemalci | Izdaja | Varnost | Element C4 | Operacij |",
        "|---|---|---|---|---|---|---|---|---|",
    ]
    details = []
    for p in sorted(SPECS.glob("*.yaml")):
        doc = yaml.safe_load(p.read_text())
        info = doc["info"]
        iface, clients, release, elem = META.get(p.name, ("—", "—", "—", "—"))
        ops = []
        for route, item in doc.get("paths", {}).items():
            for m in METHODS:
                if m in item:
                    op = item[m]
                    codes = ", ".join(str(c) for c in op.get("responses", {}))
                    ops.append((m.upper(), route, op.get("operationId", ""), op.get("summary", ""), codes))
        server = doc.get("servers", [{}])[0].get("url", "").replace("https://{host}", "")
        lines.append(f"| {info['title']} | `{p.name}` | {info['version']} | {iface} | {clients} | {release} | {security(doc)} | `{elem}` | {len(ops)} |")
        details += [
            "",
            f"## {info['title']}",
            "",
            f"{info.get('summary', '')}",
            "",
            f"Osnovna pot: `{server}` · varnost: {security(doc)} · izdaja: {release} · datoteka: `interfaces/openapi/{p.name}`",
            "",
            "| Metoda | Pot | operationId | Opis | Odgovori |",
            "|---|---|---|---|---|",
        ]
        details += [f"| {m} | `{r}` | `{o}` | {s} | {c} |" for m, r, o, s, c in ops]
    lines += [
        "",
        "Vmesnik #2 (eFTI Gate ↔ eFTI Platform) je na ravni EU določen z eDelivery (AS4); profil REST je nacionalna možnost (čl. 9(4) IU 2024/1942, ICD v0.5 §9) in se tu ne specificira, dokler o njem ne odloči MZIE (SI-GATE-FR-134, SI-GATE-FR-306).",
    ]
    return "\n".join(lines + details) + "\n"


def check_c4():
    """Vsak element C4 iz META mora obstajati v architecture/workspace.dsl."""
    import re
    dsl = (ROOT / "architecture" / "workspace.dsl").read_text()
    missing = [e for *_, e in META.values() if not re.search(rf"^\s*{e.split('.')[-1]}\s*=", dsl, re.M)]
    for e in missing:
        print(f"NAPAKA: element {e} ne obstaja v workspace.dsl", file=sys.stderr)
    refs = set(re.findall(r'"openapi" "([^"]+)"', dsl))
    for r in refs:
        if not (ROOT / r).exists():
            print(f"NAPAKA: workspace.dsl kaže na neobstoječo specifikacijo {r}", file=sys.stderr)
            missing.append(r)
    for spec in SPECS.glob("*.yaml"):
        if f"interfaces/openapi/{spec.name}" not in refs:
            print(f"NAPAKA: specifikacija {spec.name} nima elementa v workspace.dsl (lastnost openapi)", file=sys.stderr)
            missing.append(spec.name)
    return not missing


def main():
    if not check_c4():
        return 1
    text = build()
    if "--check" in sys.argv:
        if not OUT.exists() or OUT.read_text() != text:
            print("Priloga E ni osvežena: zaženi scripts/build-api-docs.py", file=sys.stderr)
            return 1
        print("Priloga E je osvežena")
        return 0
    OUT.write_text(text)
    print(OUT.relative_to(ROOT))
    return 0


if __name__ == "__main__":
    sys.exit(main())
