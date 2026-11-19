# ADR-0003: Storitve REST eFTI Gate kot pogodbe OpenAPI (contract-first)

- **Status:** predlog
- **Datum:** 2026-11-19
- **Povezave:** TS pogl. 7.9, Priloga D (C2-API), Priloga E; `interfaces/openapi/`

## Kontekst

- Vmesnik #3 (eFTI Gate ↔ AAP) je nacionalna izbira (ICD v0.5 §3.1); TS ga mora določiti tako natančno, da ga ponudnik lahko implementira in da ga pristojni organi lahko priključijo neodvisno od izvajalca.
- Referenčna implementacija že ima REST vmesnik za AAP (`/v1/aap/control/uil`, `/identifiers`, `/uil/follow-up`, asinhrono z `requestId`), a brez objavljene specifikacije OpenAPI (generira jo springdoc ob zagonu).
- Upravljanje registrov, revizija in statistika (čl. 6(3), 6(2), čl. 17 Uredbe 2020/1056) potrebujejo programski dostop tudi za avtomatizacijo pri MZIE, ne le uporabniški vmesnik.

## Odločitev

- Storitve REST eFTI Gate so v TS določene kot **pogodbe OpenAPI 3.1** v `interfaces/openapi/`: eFTI Gate AAP API, Administration API, Audit and Statistics API in (R2, pogojno) Authorisation Registry API.
- Poti AAP API sledijo RI, da je mogoče graditi na njej (ADR-0002).
- Vsaka storitev je v modelu C4 vsebnik z oznako API in lastnostjo `openapi`; Priloga E se generira iz specifikacij, CI preveri skladnost.
- Profil REST za #2 (čl. 9(4)) se ne specificira, dokler o njem ne odloči MZIE.

## Posledice

- Pristojni organi in ponudniki AAP lahko razvoj začnejo vzporedno z izvajalcem eFTI Gate.
- Izvajalec mora pogodbe uskladiti z ICD in XSD, ko bosta dokončna; spremembe potrdi MZIE (SI-GATE-FR-300).
- Polna validacija z linterjem (npr. Redocly) še ni del CI; zdaj se izvaja strukturna kontrola `scripts/check-openapi.py`.
