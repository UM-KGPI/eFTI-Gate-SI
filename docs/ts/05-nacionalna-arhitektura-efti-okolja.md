# 5 Nacionalna arhitektura eFTI okolja

> **Zahteva:** TS javnega naročila, točka 2.4: integracijske točke, izmenjava podatkov, varnostne zahteve, skladnost s standardi EU, eFTI Gate, eFTI Platform
>
> **Viri:** izbrana varianta iz M2; referenčna implementacija eFTI Gate (T2.2); NL PSA; CTG Security; eDelivery; Državni računalniški oblak (DRO)
>
> **Status:** 5.1–5.4 odprto (po M2); 5.5 osnutek v0.2 (19. 11. 2026), za interni pregled
>
> *\[5.1 Kontekst in komponente; 5.2 Integracijske točke; 5.3 Podatkovni model (skupni nabor eFTI, DU 2024/2024); 5.4 Varnost – odprto\]*

## 5.5 Gostovanje in infrastruktura

Zahteve so zapisane kot potrebni viri in lastnosti okolja, neodvisno od variante gostovanja. Številske vrednosti so **[predlog]** na podlagi predpostavk iz 5.5.3; izvajalec jih potrdi z modelom obremenitev iz M2 in obremenitvenimi testi (SI-GATE-NFR-132, SI-GATE-NFR-240). Elementi so v pogledu namestitve C4 (Priloga D).

### 5.5.1 Variante gostovanja

| Varianta | Opis | Prednosti | Tveganja |
|---|---|---|---|
| H1 Državni računalniški oblak (DRO) | virtualni strežniki v DRO (upravlja MNZJU), dve lokaciji (Ljubljana, Maribor), ISO/IEC 27001:2022 | obstoječa infrastruktura države, skladnost z varnostnimi pravili državne uprave, brez nakupa strojne opreme | razpoložljivost zmogljivosti in HSM v DRO do aprila 2027 [preveriti]; prehod na DRO.next |
| H2 Co-location z opremo MZIE | strojna oprema MZIE v dveh komercialnih podatkovnih centrih v Sloveniji | popoln nadzor nad opremo in omrežjem | nakup in vzdrževanje opreme, dobavni roki, upravljanje dveh lokacij |
| H3 Upravljana zasebna infrastruktura izvajalca (IaaS) | storitev izvajalca ali tretje osebe v Sloveniji ali EGP | najhitrejša vzpostavitev | odvisnost od ponudnika, preverjanje skladnosti z ZInfV-1 in hrambo podatkov v EGP |

Varianto izbere MZIE ob M2. Zahteve 5.5.2–5.5.8 veljajo za vse variante; 5.5.6 in 5.5.7 dodatno za H2.

### 5.5.2 Okolja in topologija

- Dve geografsko ločeni lokaciji za produkcijo: primarna aktivna, rezervna pripravljena (aktivno-pasivno) z asinhrono replikacijo podatkov; RTO 4 h, RPO 15 min (SI-GATE-NFR-005).
- Ločena okolja DEV, TEST, PRE in PROD (SI-GATE-NFR-074, SI-GATE-NFR-210).
- Omrežne cone: DMZ (vstopna točka, eDelivery Access Point), aplikacijska cona (eFTI Gate Service, storitve OpenAPI, strežnik identitet, sporočilni posrednik), podatkovna cona (podatkovne baze, shramba revizijskih sledi), upravljalna cona (bastion, nadzor).
- Virtualizacija: strežniška virtualizacija (KVM, VMware vSphere, Hyper-V ali enakovredno) ali gruča vsebnikov (Kubernetes ali enakovredno) na virtualnih ali fizičnih strežnikih; komponente se namestijo kot vsebniki OCI (SI-GATE-NFR-152).

### 5.5.3 Predpostavke za dimenzioniranje

| Predpostavka | Vrednost [predlog] | Opomba |
|---|---|---|
| Revizijski dogodki eFTI Gate na leto | 20 milijonov | vključno z iskanji, ki jih eFTI Gate drugih DČ posredujejo vsem eFTI Gate (TGD §6.2) |
| Povprečna velikost revizijskega zapisa | 1,5 KB | obvezni podatki iz TGD §9.2 in neobvezni podatki |
| Hramba revizijskih sledi | 2 leti | čl. 6(2)(h); daljša, če jo zahtevajo nacionalni predpisi |
| Hramba sporočil v eDelivery Access Point | 30 dni vsebina, 90 dni metapodatki | daljša hramba ni potrebna, ker revizijska sled hrani obvezne podatke |
| Aktivni zapisi v Registry of Identifiers | do 1 milijona | zapisi se po deaktivaciji izbrišejo (čl. 11(4)) |
| Konica obremenitve | določi model obremenitev v M2 | dimenzioniranje z rezervo 2× (SI-GATE-NFR-132) |

Iz predpostavk: revizijska sled potrebuje približno 90 GB za 2 leti z indeksi; navedene podatkovne kapacitete imajo rezervo za rast in daljšo hrambo.

### 5.5.4 Računalniški viri produkcijskega okolja (na lokacijo)

| Komponenta | Element C4 | Št. VM | vCPU/VM | RAM GB/VM | Sistemski disk GB/VM | Podatkovni disk GB/VM |
|---|---|---|---|---|---|---|
| Vstopna točka (reverse proxy, API gateway, WAF) | — | 2 | 2 | 4 | 40 | — |
| eFTI Gate Service (vključno z eFTI Gate AAP API) | `vrata.gateService`, `vrata.caApi` | 3 | 4 | 8 | 40 | — |
| Administration API, Audit and Statistics API, upravljavska aplikacija | `vrata.adminApi`, `vrata.auditApi`, `vrata.admin` | 2 | 2 | 4 | 40 | — |
| Strežnik identitet (OIDC) | `vrata.idp` | 2 | 2 | 4 | 40 | — |
| Sporočilni posrednik (gruča) | `vrata.mq` | 3 | 2 | 4 | 40 | 50 |
| eDelivery Access Point (Domibus) | `vrata.ap` | 2 | 4 | 8 | 40 | — |
| Baza dostopovne točke (primarna + replika) | `vrata.apDb` | 2 | 4 | 16 | 40 | 250 |
| Podatkovna baza eFTI Gate (primarna + replika) | `vrata.db` | 2 | 4 | 16 | 40 | 250 |
| Nadzor delovanja in zbiranje dnevnikov | `vrata.monitoring` | 2 | 4 | 16 | 40 | 500 |
| Upravljalni strežnik (bastion) | — | 1 | 2 | 4 | 40 | — |
| **Skupaj na lokacijo** | | **21** | **64** | **176** | **2.990 (sistemski in podatkovni skupaj)** | |

Dodatno na lokacijo: shramba revizijskih sledi z možnostjo nespremenljivosti (WORM ali enakovredno, npr. objektna shramba z zaklepanjem) vsaj **1 TB** uporabne kapacitete; prostor za varnostne kopije na drugi lokaciji vsaj **10 TB** (30-dnevna hramba dnevnih kopij in mesečne kopije 1 leto) [predlog].

### 5.5.5 Viri po okoljih

| Okolje | Oznaka | vCPU | RAM (GB) | Disk (GB) | Namen |
|---|---|---|---|---|---|
| Produkcijsko – primarna lokacija | PROD-1 | 64 | 176 | 2.990 | aktivno |
| Produkcijsko – rezervna lokacija | PROD-2 | 64 | 176 | 2.990 | pripravljeno (aktivno-pasivno), asinhrona replikacija |
| Predprodukcijsko | PRE | 64 | 176 | 2.990 | reprezentativno za produkcijo (SI-GATE-NFR-101), povezano v integracijsko omrežje |
| Testno | TEST | 32 | 88 | 1.495 | integracijski in sistemski testi |
| Razvojno | DEV | 16 | 44 | 748 | razvoj, CI |
| **Skupaj** | | **240** | **660** | **11.212** | |

### 5.5.6 Strojna oprema (varianta H2)

Na vsako produkcijsko lokacijo [predlog]:

| Postavka | Količina | Najmanjše lastnosti |
|---|---|---|
| Virtualizacijski strežnik | 3 | 2 procesorja, skupaj vsaj 32 jeder; 256 GB RAM; 2 sistemska diska NVMe v zrcaljenju; 4 × 25 GbE; dva napajalnika; upravljanje izven pasu |
| Shramba | 1 sistem ali razpršena shramba | vsaj 6 TB uporabne kapacitete SSD/NVMe, odpornost na izpad diska in vozlišča, šifriranje |
| Strojni varnostni modul (HSM) | 2 (v visoki razpoložljivosti) | FIPS 140-2 ali 140-3 raven 3 ali Common Criteria EAL4+ (ali enakovredno); podpora PKCS#11 |
| Požarni zid naslednje generacije | 2 (v visoki razpoložljivosti) | ločevanje con, IPS, VPN za upravljanje |
| Stikalo | 2 | 25 GbE dostop, redundantna povezava |
| Izenačevalnik obremenitve / WAF | 2 ali programsko na VM (5.5.4) | TLS 1.2+, mTLS, omejevanje hitrosti |
| Naprava za varnostne kopije | 1 na rezervni lokaciji | vsaj 10 TB uporabne kapacitete, nespremenljive kopije |

Neprodukcijska okolja (PRE, TEST, DEV) na primarni lokaciji ločeno od produkcije: dodatni 3 virtualizacijski strežniki enakih lastnosti in vsaj 6 TB shrambe. Sočasna potreba produkcije na lokacijo je 64 vCPU in 176 GB RAM; trije strežniki zagotavljajo delovanje tudi ob izpadu enega (N+1) in sklepčnost gruče.

### 5.5.7 Zahteve za podatkovni center (co-location)

Velja za varianto H2; za H1 in H3 mora ponudnik oziroma upravljavec DRO dokazati enakovredne lastnosti.

| Področje | Zahteva [predlog] |
|---|---|
| Lokacija | dva podatkovna centra v Sloveniji, oddaljena vsaj 30 km (različna tveganja poplav in izpada napajanja); podatki ne zapustijo EGP (SI-GATE-NFR-053) |
| Razpoložljivost | Uptime Institute Tier III, EN 50600 razred razpoložljivosti 3 ali enakovredno; pogodbena razpoložljivost napajanja in hlajenja vsaj 99,98 % |
| Napajanje | dva neodvisna napajalna voda do omare (A/B), UPS in agregat z avtonomijo vsaj 24 ur |
| Hlajenje | redundanca vsaj N+1 |
| Požarna zaščita | zgodnje zaznavanje dima, gašenje s plinom ali enakovredno |
| Fizična varnost | nadzor dostopa 24/7, beleženje vstopov, videonadzor, zaklenjena omara MZIE, dostop le pooblaščenih oseb |
| Certifikati | ISO/IEC 27001; zaželeno ISO 22301 in ISO 50001 ali enakovredno |
| Omrežje | nevtralnost glede ponudnikov povezav, vsaj dva neodvisna ponudnika internetne povezave, vsaj 1 Gbit/s na lokacijo, zaščita pred porazdeljenimi napadi (DDoS), javni naslovi IPv4 in IPv6 |
| Povezava med lokacijama | redundantna šifrirana povezava za replikacijo, vsaj 1 Gbit/s |
| Prostor | vsaj ena omara 42U na lokacijo z najmanj 6 kW razpoložljive moči |
| Podpora | storitve »remote hands« 24/7, odzivni čas do 1 ure |

### 5.5.8 Zahteve

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-500 | Produkcijsko okolje mora delovati na dveh geografsko ločenih lokacijah v Sloveniji (primarna in rezervna) z asinhrono replikacijo podatkov, ki omogoča RTO in RPO iz SI-GATE-NFR-005. | SI-GATE-NFR-005; 5.5.2 | M | OP | D, P |
| SI-GATE-NFR-501 | Izvajalec mora za vsa okolja zagotoviti računalniške vire najmanj v obsegu iz 5.5.4 in 5.5.5 oziroma v obsegu, ki ga utemelji z modelom obremenitev in obremenitvenimi testi, če je ta večji. | 5.5.3–5.5.5; SI-GATE-NFR-132 | M | OP | P, T |
| SI-GATE-NFR-502 | Komponente morajo biti nameščene kot vsebniki OCI v virtualiziranem okolju ali gruči vsebnikov; namestitev mora biti opisana kot koda in ponovljiva v vseh okoljih. | SI-GATE-NFR-152; 5.5.2 | M | OP | D |
| SI-GATE-NFR-503 | Omrežje mora biti razdeljeno na cone iz 5.5.2; promet med conami mora biti omejen z izrecnimi pravili požarnega zidu; upravljalni dostop le prek upravljalne cone in bastiona. | SI-GATE-NFR-073, NFR-074 | M | OP | P, T |
| SI-GATE-NFR-504 | Zasebni ključi eFTI Gate morajo biti v HSM z visoko razpoložljivostjo na vsaki produkcijski lokaciji (lastnosti iz 5.5.6) ali v enakovredni storitvi HSM gostitelja. | čl. 10(2); SI-GATE-NFR-063 | M | ED | P |
| SI-GATE-NFR-505 | Shramba revizijskih sledi mora omogočati nespremenljivo hrambo vsaj 2 leti z replikacijo na rezervno lokacijo. | čl. 6(2)(h); SI-GATE-NFR-082 | M | OP | D |
| SI-GATE-NFR-506 | Pri varianti H2 mora podatkovni center izpolnjevati zahteve iz 5.5.7; pri H1 in H3 mora upravljavec gostovanja predložiti dokazila o enakovrednih lastnostih. | 5.5.7 | P | OP | P |
| SI-GATE-NFR-507 | Izvajalec mora pri varianti H2 dobaviti, namestiti in vzdrževati strojno opremo iz 5.5.6 (ali zmogljivejšo) z garancijo in podporo proizvajalca vsaj 5 let [predlog]. | 5.5.6 | P | OP | P |
| SI-GATE-NFR-508 | Izvajalec mora vsako leto pripraviti oceno kapacitet (obremenitev, rast revizijske sledi in Registry of Identifiers) in predlagati razširitve, preden izraba preseže 70 % [predlog]. | SI-GATE-NFR-132 | M | OP | P |
