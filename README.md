# Slovenska eFTI-vrata – tehnične specifikacije (M3)

Projektna naloga / tehnične specifikacije za vzpostavitev slovenskih eFTI-vrat po Uredbi (EU) 2020/1056.
Pogodba C2430-26-100042 (MZIE – UM FGPA), mejnik **M3, rok 24. 12. 2026**. Odvisno od M2 (izbira variante, 24. 11. 2026).

*Technical specification (tender terms of reference) for the Slovenian eFTI Gate; written in Slovenian, architecture in C4.*

## Zgradba

| Mapa | Vsebina |
|---|---|
| [`docs/ts/`](docs/ts/README.md) | Besedilo TS po poglavjih (struktura iz delovnega osnutka v0.1, 26. 10. 2026) |
| [`architecture/workspace.dsl`](architecture/workspace.dsl) | Model C4 (Structurizr DSL) – edini vir diagramov |
| `architecture/diagrams/` | Generirani diagrami (PNG, PlantUML, Mermaid) |
| [`docs/adr/`](docs/adr/) | Arhitekturne odločitve |
| [`sources/`](sources/README.md) | Seznam virov (izvirniki niso v repozitoriju) |
| `scripts/` | Upodabljanje diagramov, sestava .docx |

## Delo

```bash
scripts/render-diagrams.sh     # validacija modela + diagrami (structurizr-cli, plantuml)
scripts/build-docx.sh          # delovna verzija TS v build/ (pandoc)
scripts/build-docx.sh --final  # brez internega poglavja 0
```

Pravila:
- Zahteve označujemo `SI-GATE-FR-NNN` (funkcionalne) in `SI-GATE-NFR-NNN` (nefunkcionalne), z virom, prioriteto in načinom preverjanja; sledljivost v [Prilogi C](docs/ts/priloga-c-sledljivost.md).
- Vsaka trditev o EU specifikacijah navaja vir in verzijo (TGD, ICD, XSD se še spreminjajo).
- Spremembe prek vej in pull requestov; arhitekturne odločitve kot ADR.
