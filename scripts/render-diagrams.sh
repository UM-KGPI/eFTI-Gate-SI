#!/usr/bin/env bash
# Izvozi poglede iz architecture/workspace.dsl v PlantUML (izvoznik Structurizr, ki upošteva sloge in legende) in PNG.
# Potrebno: structurizr-cli, plantuml (+ graphviz).
set -euo pipefail
cd "$(dirname "$0")/.."
OUT=architecture/diagrams
rm -rf "$OUT" && mkdir -p "$OUT"
structurizr-cli validate -workspace architecture/workspace.dsl
structurizr-cli export -workspace architecture/workspace.dsl -format plantuml/structurizr -output "$OUT"
plantuml -tpng "$OUT"/*.puml
echo "Diagrami v $OUT"
