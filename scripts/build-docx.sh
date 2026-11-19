#!/usr/bin/env bash
# Sestavi TS iz poglavij v docs/ts v en .docx (za oddajo M3 naročniku).
# Uporaba: scripts/build-docx.sh [--final]   (--final izpusti interno poglavje 0)
# Potrebno: pandoc. Diagrame predhodno osveži s scripts/render-diagrams.sh.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p build
FILES=(docs/ts/README.md)
FILES+=(docs/ts/0[1-9]-*.md docs/ts/1[0-9]-*.md docs/ts/priloga-*.md)
REF=()
[[ -f templates/reference.docx ]] && REF=(--reference-doc templates/reference.docx)
pandoc "${FILES[@]}" --from gfm --resource-path=docs/ts:. ${REF[@]+"${REF[@]}"} \
  --toc --toc-depth=2 -o build/TS_eFTI-vrata_SI.docx
echo "build/TS_eFTI-vrata_SI.docx"
