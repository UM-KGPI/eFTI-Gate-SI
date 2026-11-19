#!/usr/bin/env python3
"""Strukturna kontrola specifikacij OpenAPI v interfaces/openapi/*.yaml (brez zunanjih orodij razen PyYAML).

Preveri: različico OpenAPI 3.1, obvezna polja info, razrešljivost vseh $ref, enoličnost operationId,
odgovore pri vsaki operaciji, definirane oznake (tags) in sheme varnosti ter parametre poti.
Ni nadomestilo za polni linter (npr. Redocly), pokrije pa napake, ki najpogosteje pokvarijo pogodbo.
Uporaba: scripts/check-openapi.py [datoteka ...]
"""
import pathlib
import re
import sys

import yaml

ROOT = pathlib.Path(__file__).resolve().parent.parent
METHODS = {"get", "put", "post", "delete", "patch", "head", "options"}


def resolve(doc, ref):
    if not ref.startswith("#/"):
        return None
    node = doc
    for part in ref[2:].split("/"):
        part = part.replace("~1", "/").replace("~0", "~")
        if not isinstance(node, dict) or part not in node:
            return None
        node = node[part]
    return node


def walk(node, path=""):
    if isinstance(node, dict):
        for k, v in node.items():
            yield path, k, v
            yield from walk(v, f"{path}/{k}")
    elif isinstance(node, list):
        for i, v in enumerate(node):
            yield from walk(v, f"{path}/{i}")


def unquoted_hash(text):
    """Vrstice, kjer bi ' #' v nenavedeni vrednosti YAML začel komentar in odrezal besedilo."""
    out, block = [], None
    for i, line in enumerate(text.split("\n"), 1):
        ind = len(line) - len(line.lstrip())
        if block is not None and (not line.strip() or ind > block):
            continue
        block = None
        if re.search(r":\s*[|>][-+]?\s*$", line):
            block = ind
            continue
        if re.match(r"^\s*(?:- )?[\w$'\"-]+:\s+(?!['\"{\[])(.*\s#.*)$", line):
            out.append(i)
    return out


def check(p):
    errs = []
    text = p.read_text()
    errs += [f"vrstica {i}: nenavedena vrednost z ' #' (YAML jo odreže kot komentar)" for i in unquoted_hash(text)]
    doc = yaml.safe_load(text)
    if not str(doc.get("openapi", "")).startswith("3.1"):
        errs.append("openapi mora biti 3.1.x")
    info = doc.get("info", {})
    for k in ("title", "version", "description"):
        if not info.get(k):
            errs.append(f"info.{k} manjka")
    for path, k, v in walk(doc):
        if k == "$ref" and isinstance(v, str) and resolve(doc, v) is None:
            errs.append(f"nerazrešljiv $ref {v} ({path})")
    tags = {t["name"] for t in doc.get("tags", [])}
    schemes = set(doc.get("components", {}).get("securitySchemes", {}))
    for req in doc.get("security", []):
        for s in req:
            if s not in schemes:
                errs.append(f"varnostna shema {s} ni definirana")
    ops = {}
    for route, item in (doc.get("paths") or {}).items():
        params = set(re.findall(r"\{(\w+)\}", route))
        for m, op in item.items():
            if m not in METHODS:
                continue
            oid = op.get("operationId")
            if not oid:
                errs.append(f"{m.upper()} {route}: manjka operationId")
            elif oid in ops:
                errs.append(f"podvojen operationId {oid}")
            ops[oid] = route
            if not op.get("responses"):
                errs.append(f"{m.upper()} {route}: ni odgovorov")
            for t in op.get("tags", []):
                if t not in tags:
                    errs.append(f"{m.upper()} {route}: oznaka {t} ni definirana")
            declared = set()
            for prm in op.get("parameters", []) + item.get("parameters", []):
                prm = resolve(doc, prm["$ref"]) if "$ref" in prm else prm
                if prm and prm.get("in") == "path":
                    declared.add(prm["name"])
            if params - declared:
                errs.append(f"{m.upper()} {route}: parametri poti brez definicije {sorted(params - declared)}")
    return doc, ops, errs


def main():
    files = [pathlib.Path(a) for a in sys.argv[1:]] or sorted((ROOT / "interfaces" / "openapi").glob("*.yaml"))
    bad = 0
    for p in files:
        doc, ops, errs = check(p)
        rel = p.resolve().relative_to(ROOT) if p.resolve().is_relative_to(ROOT) else p
        print(f"{rel}: {doc['info'].get('title')} {doc['info'].get('version')} – {len(ops)} operacij", "OK" if not errs else f"{len(errs)} napak")
        for e in errs:
            print("  NAPAKA:", e)
        bad += len(errs)
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
