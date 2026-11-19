#!/usr/bin/env bash
# Izvozi poglede iz architecture/workspace.dsl v PlantUML (C4-PlantUML), Mermaid in PNG.
# Potrebno: structurizr-cli, plantuml (+ graphviz).
set -euo pipefail
cd "$(dirname "$0")/.."
OUT=architecture/diagrams
mkdir -p "$OUT"
structurizr-cli validate -workspace architecture/workspace.dsl
structurizr-cli export -workspace architecture/workspace.dsl -format plantuml/c4plantuml -output "$OUT"
structurizr-cli export -workspace architecture/workspace.dsl -format mermaid -output "$OUT"
plantuml -tpng "$OUT"/*.puml
echo "Diagrami v $OUT"
