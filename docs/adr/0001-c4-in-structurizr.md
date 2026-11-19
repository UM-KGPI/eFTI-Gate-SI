# ADR-0001: Arhitektura po modelu C4, diagrami kot koda (Structurizr DSL)

- **Status:** sprejeto
- **Datum:** 2026-11-19
- **Povezave:** TS pogl. 5, Priloga D

## Kontekst

TS (mejnik M3) mora opisati nacionalno arhitekturo eFTI okolja (TS JN točka 2.4) za ponudnike ločenega javnega naročila. Diagrami se bodo do 24. 12. 2026 pogosto spreminjali (izbira variante v M2, ICD, XSD). Ročno risani diagrami se razhajajo med seboj in z besedilom.

## Odločitev

- Arhitekturo opisujemo po modelu C4: kontekst (C1), vsebniki (C2), komponente (C3) in dinamični pogledi; raven kode (C4) izpustimo, ker je stvar izvajalca.
- En sam model v `architecture/workspace.dsl` (Structurizr DSL); vsi pogledi izhajajo iz njega.
- Slike za TS (.docx) generiramo s `scripts/render-diagrams.sh` (C4-PlantUML, PNG); GitHub Actions ob vsaki spremembi preveri veljavnost modela.
- Besedilo TS ostane v Markdownu (`docs/ts`), .docx za naročnika sestavimo s `scripts/build-docx.sh` (pandoc).

## Obravnavane možnosti

1. Structurizr DSL (izbrano): en model, več pogledov, izvoz v PlantUML z legendami (izvoznik Structurizr).
2. Mermaid C4 neposredno v Markdownu: GitHub ga prikaže, a je funkcija eksperimentalna, vsak diagram je ločen in se lahko razide z drugimi.
3. Diagrami v Visio/draw.io: ni sledljivosti sprememb, težko pregledovanje.

## Posledice

- Pregled sprememb arhitekture poteka prek pull requestov.
- Ekipa potrebuje `structurizr-cli` in `plantuml` za lokalno upodabljanje (ali uporabi artefakte iz CI).
