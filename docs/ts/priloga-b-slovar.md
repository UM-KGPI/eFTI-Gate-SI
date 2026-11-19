# Priloga B: Slovar pojmov in kratic

> **Status:** osnutek v0.2 (19. 11. 2026)

**Pravilo.** TS uporablja dogovorjene izraze eFTI v angleščini, kot jih uporabljajo tehnične smernice (TGD), Interface Control Document (ICD), referenčna implementacija in skupnost eFTI. Ti izrazi se v besedilu ne prevajajo in ne sklanjajo. Ta priloga za vsak izraz navaja ustrezni izraz iz slovenske različice izvedbene uredbe (EU) 2024/1942 (IU), kjer obstaja, in razlago v slovenščini. Splošni pravni izrazi (pristojni organ, uradnik pristojnega organa, gospodarski subjekt) ostanejo slovenski.

## B.1 Dogovorjeni izrazi eFTI

| Izraz v TS | Izraz v slovenski različici IU | Razlaga | Vir |
|---|---|---|---|
| eFTI Gate | prehod eFTI | Komponenta, ki jo vzpostavi država članica in ki posreduje zahteve pristojnih organov eFTI Platform (neposredno ali prek eFTI Gate drugih držav), vodi Registry of Identifiers in revizijsko sled. V Sloveniji en eFTI Gate. | čl. 1(12), čl. 6 IU |
| requesting eFTI Gate | prehod, ki zahteva dostop | Vloga eFTI Gate, ki obdela zahtevo, vloženo prek AAP svoje države. | čl. 1(13) IU |
| receiving eFTI Gate | prehod, ki prejme zahtevo | Vloga eFTI Gate, ki obdela zahtevo, prejeto od drugega eFTI Gate, in jo posreduje eFTI Platform. | čl. 1(14) IU |
| eFTI Platform | platforma eFTI | Certificirana platforma IKT, na kateri gospodarski subjekti hranijo zakonsko predpisane informacije v elektronski obliki in jih dajo na voljo pristojnim organom. | Uredba (EU) 2020/1056, čl. 3, 9 |
| eFTI Service Provider | ponudnik storitev eFTI | Pravna ali fizična oseba, ki gospodarskim subjektom zagotavlja storitve eFTI Platform. | Uredba (EU) 2020/1056, čl. 3 |
| Registry of eFTI Platforms | (register iz čl. 6(3)(f)) | Register eFTI Gate z identifikacijskimi številkami, varnostnimi ključi in certifikacijskim statusom povezanih eFTI Platform. | čl. 6(3)(f) IU; TGD §8.3 |
| AAP (Authority Access Point) | dostopovna točka organa | Edina točka dostopa uradnika do okolja eFTI: avtentikacija, odobritev zahtev, revizijska sled. Lahko je del eFTI Gate ali sistemov pristojnih organov. | čl. 1(11), čl. 4 IU |
| UAP (User Application) | uporabniška aplikacija | Aplikacija, s katero uradnik ustvari zahtevo in si ogleda odgovor (npr. mobilna aplikacija na terenu). | čl. 1(22), čl. 7 IU |
| Authorisation Registry | register dovoljenj | Evidenca pravic dostopa (podsklopi podatkov) in pravic obdelave posameznih uradnikov. | čl. 5 IU; TGD §5 |
| Registry of Identifiers (RoI) | register identifikatorjev | Del eFTI Gate, v katerem eFTI Platform objavijo UIL z identifikatorji (npr. registrska oznaka), da je UIL mogoče najti z iskanjem. | čl. 11 IU; TGD §6 |
| search mechanism | iskalni mehanizem | Del eFTI Gate, ki iz UIL razbere ciljni eFTI Gate in eFTI Platform ter išče v Registry of Identifiers. | čl. 8 IU |
| UIL (Unique electronic Identifying Link) | edinstvena elektronska identifikacijska povezava | Povezava, ki enolično določa eFTI Gate, eFTI Platform in eFTI dataset (UUID); gospodarski subjekt jo pokaže npr. kot kodo QR. | Uredba (EU) 2020/1056, čl. 4(3); čl. 11(2) IU |
| eFTI data request | zahteva za dostop do podatkov eFTI | Zahteva, ki jo uradnik v imenu pristojnega organa vloži za prejem podatkov eFTI. | čl. 1(5), čl. 3 IU |
| follow-up communication | sporočilo o nadaljnjem ukrepanju | Sporočilo uradnika gospodarskemu subjektu po pregledu podatkov (npr. manjkajoči podatki, ugotovljene napake). | čl. 1(6), čl. 3(4)–(5) IU |
| eFTI dataset; CMDS (consignment movement dataset) | sklop podatkov eFTI; sklop podatkov o premiku pošiljke | Nabor podatkov eFTI za en premik pošiljke, ki ga hrani eFTI Platform. | DU 2024/2024; TGD2 |
| eFTI data subset | podsklop podatkov eFTI | Del podatkov, ki ustreza posameznemu pravnemu aktu (npr. nevarno blago, kabotaža); določa, kaj sme uradnik videti. | DU 2024/2024 |
| eFTI common data set | skupni nabor podatkov eFTI | Celoten nabor podatkovnih elementov eFTI. | DU 2024/2024 |
| eDelivery Access Point | dostopovna točka za eDelivery | Komunikacijska komponenta (AS4) za izmenjavo sporočil med eFTI Gate ter med eFTI Gate in eFTI Platform. | čl. 1(16), čl. 9 IU |
| static / dynamic discovery | statično / dinamično iskanje | Način, kako dostopovna točka za eDelivery najde naslov druge točke: iz lastne konfiguracije ali prek SML/SMP. | čl. 1(17)–(18) IU |
| "no response" message | sporočilo »ni odgovora« | Sporočilo, ki ga eFTI Gate pošlje, če po potrditvi prejema zahteve v 60 sekundah ne prejme odgovora. | čl. 3(3)(d), 6(2)(f) IU |
| TGD (Technical Guidance Documents) | dokumenti s tehničnimi smernicami | Nezavezujoči tehnični dokumenti EK in DČ za izvajanje IU. | čl. 1(23) IU |
| PRA (Platform Readiness Assessment) | — | Predlog eFTI4LIVE: priklop eFTI Platform na podlagi poročila TCT do formalne certifikacije. | eFTI4LIVE M2.3 |
| TCT (Technical Conformance Testing) | — | Samodejni testi skladnosti eFTI Platform (in eFTI Gate) s specifikacijami. | DG MOVE; eFTI4LIVE M2.3 |
| Union Reference List | — | Seznam certifikacijskih statusov eFTI Platform na ravni EU (v pripravi z DA o certificiranju). | AG Union Registry; osnutek DA |

## B.2 Izrazi, ki ostanejo slovenski

| Izraz v TS | Angleško (TGD, ICD) | Razlaga | Vir |
|---|---|---|---|
| pristojni organ | Competent Authority (CA) | Organ, ki preverja skladnost s predpisi, za katere se zahtevajo zakonsko predpisane informacije (npr. Policija, FURS, IRSI). | Uredba (EU) 2020/1056, čl. 3 |
| uradnik pristojnega organa | CA Officer | Fizična oseba, ki v imenu pristojnega organa vlaga eFTI data request. | čl. 1(3) IU |
| gospodarski subjekt | Economic Operator (EO) | Prevoznik, špediter ali drug subjekt, ki daje zakonsko predpisane informacije na voljo. | Uredba (EU) 2020/1056, čl. 3 |
| upravljavska aplikacija | administration application | Slovenska komponenta za upravljanje registrov, priklop eFTI Platform, certifikatov in pregled revizijskih sledi. | ta TS, 7.6 |
| registri povezav | connection registries | Register eFTI Gate drugih DČ, register AAP in Registry of eFTI Platforms. | čl. 6(3)(d)–(f) IU |
| služba za pomoč (raven 1, 2, 3) | helpdesk (level 1, 2, 3) | Mreža služb za tehnično pomoč. | čl. 12 IU; TGD §10 |
| mreža za operativno podporo | operational support network | Delovna skupina DČ in EK; člani so nacionalne kontaktne točke eFTI. | čl. 13 IU |

## B.3 Kratice

| Kratica | Pomen |
|---|---|
| AS4 | profil eDelivery za izmenjavo sporočil |
| CMDS | consignment movement dataset |
| DA / DU | delegirani akt / delegirana uredba |
| DČ | država članica |
| DS | delovni sklop (pogl. 11.1) |
| FTE | ekvivalent polnega delovnega časa (full-time equivalent) |
| G2G, G2P, P2G, G2A | eFTI Gate–eFTI Gate, eFTI Gate–eFTI Platform, eFTI Platform–eFTI Gate, eFTI Gate–AAP |
| ICD | Interface Control Document (eFTI4LIVE TG1.6, CTG Data Model & Interfaces) |
| IU | izvedbena uredba (EU) 2024/1942 |
| mTLS | medsebojna avtentikacija TLS (odjemalec in strežnik s certifikatom) |
| MZIE | Ministrstvo za infrastrukturo in energetiko |
| OM | osebni mesec (obseg dela ene osebe v enem mesecu) |
| OAuth 2.0 / OIDC | standarda za avtorizacijo (strojni odjemalci) in prijavo uporabnikov (OpenID Connect) |
| OpenAPI | standard za opis vmesnikov REST (različica 3.1); specifikacije v `interfaces/openapi/` |
| RFC 9457 | standardna oblika sporočil o napakah v vmesnikih HTTP (Problem Details) |
| RI | referenčna implementacija eFTI Gate (eFTI4EU, eFTI4LIVE TG2.2) |
| SML / SMP | Service Metadata Locator / Publisher (eDelivery) |
| XSD | shema XML za sporočila eFTI |

## B.4 Kode komponent (stolpec Komp.)

| Koda | Komponenta |
|---|---|
| EG | eFTI Gate (storitev eFTI Gate Service) |
| SM | search mechanism |
| RoI | Registry of Identifiers |
| ED | eDelivery Access Point |
| AAP | Authority Access Point |
| AR | Authorisation Registry |
| UAP | User Application |
| UP | upravljavska aplikacija |
| OP | obratovanje in organizacija |
| TCT | okolje TCT za eFTI Platform |
