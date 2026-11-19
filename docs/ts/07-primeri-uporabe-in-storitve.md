# 7 Primeri uporabe in storitve

> **Zahteva:** storitve eFTI-vrat do drugih vrat, platform, pristojnih organov
>
> **Viri:** TGD v1.0.1 (izvoz 9. 9. 2026, v pregledu) §3.3, §6, §7; ICD v0.4 in povzetek ICD v0.5 (Praga, 19. 11. 2026); referenčna implementacija eFTI-vrat (RI); NL PvE pogl. 3–7
>
> **Status:** osnutek v0.2 (19. 11. 2026), za interni pregled

## 7.0 Način zapisa

Vsak primer uporabe (PU) navaja akterje, predpogoje, glavni potek, izjeme in zahteve. Zahteve v tem poglavju (`SI-GATE-FR-2NN`) podrobneje določajo zahteve iz pogl. 6 na podlagi tehničnih smernic in ICD; vir je naveden pri vsaki zahtevi. Stolpci P, Komp. in Preverjanje imajo pomen iz 6.0.

**Stabilnost virov.** TGD v1.0.1 je v pregledu, ICD v0.5 je osnutek (dokumenta v0.5 še nimamo, le povzetek s predstavitve v Pragi), shema XSD je v različici 1.0.0 Beta (izdaja 1.0 napovedana za pomlad 2027). Zahteve, ki se sklicujejo na te vire, so označene z **(osnutek)** in jih je treba pred oddajo M3 preveriti glede na takrat veljavne verzije.

**Vloge prehoda.** V vsakem PU je slovenski prehod eFTI lahko *prehod, ki zahteva dostop* (zahteva slovenskega organa) ali *prehod, ki prejme zahtevo* (zahteva tujega prehoda za podatke na slovenski platformi). Obe vlogi sta obvezni.

**Vmesniki** (ICD v0.5 §3.1, osnutek): #1 prehod–prehod (G2G) in #2 prehod–platforma (G2P) sta normativna na ravni EU; #3 prehod–AAP (G2A) je nacionalna izbira in ga določa ta TS.

## 7.1 Storitve med prehodi (G2G)

### PU-G2G-1 Posredovanje zahteve za dostop prek UIL tujemu prehodu

- **Akterji:** slovenski prehod (zahteva dostop), tuji prehod (prejme zahtevo), tuja platforma.
- **Predpogoj:** odobrena zahteva AAP z UIL; tuji prehod je v registru prehodov (SI-GATE-FR-092).
- **Potek (TGD §3.3.1, različica b):** (1) prehod razbere UIL in ugotovi, da identifikator ciljnega prehoda ni njegov; (2) poišče končno točko ciljnega prehoda (statično odkrivanje) in posreduje zahtevo prek eDelivery; (3) tuji prehod jo dostavi platformi; (4) odgovor se vrne po isti poti; (5) slovenski prehod preveri ključ tujega prehoda in odgovor posreduje AAP.
- **Izjeme:** neznan identifikator prehoda; neveljaven ključ; potek časa (60 s); napaka tujega prehoda (posreduje se nespremenjena).

### PU-G2G-2 Obdelava zahteve tujega prehoda (prehod, ki prejme zahtevo)

- **Potek:** prejem prek eDelivery → preverjanje ključa pošiljatelja (FR-074) → razrešitev platforme iz UIL → preverjanje certifikacijskega statusa platforme → dostava platformi → odgovor po isti poti.

### PU-G2G-3 Iskanje po identifikatorjih v omrežju prehodov

- **Potek (TGD §3.3.2–3.3.3, §6.2–6.3):** slovenski prehod poišče zadetke v svojem registru identifikatorjev in zahtevo posreduje drugim prehodom; zbere njihove odgovore in jih posreduje AAP sproti (asinhrono) ali jih združi (sinhrono).
- **Obratna smer:** slovenski prehod mora odgovoriti na vsako iskanje drugega prehoda, ne glede na to, ali ta prehod uporablja omejeno iskanje.

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-200 | Prehod mora podpirati obe vlogi, »prehod, ki zahteva dostop« in »prehod, ki prejme zahtevo«, za vse vrste sporočil (zahteva prek UIL, iskanje po identifikatorjih, sporočilo o nadaljnjem ukrepanju). | čl. 1(13), 1(14); TGD §3.3 | M | PE | T |
| SI-GATE-FR-201 | Prehod mora iskanje po identifikatorjih posredovati vsem prehodom v registru prehodov; kot nastavljivo možnost mora podpirati omejeno iskanje na izbrane države (seznam ali izbira v UA). | TGD §6.2 | M | PE, IM | T |
| SI-GATE-FR-202 | Prehod mora odgovoriti na vsako iskanje, ki ga prejme od drugega prehoda. | TGD §6.2 | M | PE, IM | T |
| SI-GATE-FR-203 | Pri sinhronem načinu mora prehod delne rezultate združiti v en odgovor s statusom vsakega prehoda (COMPLETE, ERROR, PENDING, TIMEOUT, UNAUTHORISED); pri asinhronem jih mora posredovati AAP takoj ob prejemu. Kateri način (ali oba) uporablja vmesnik #3, določi 7.5. | TGD §6.3 | M | PE | T |
| SI-GATE-FR-204 | Prehod mora pri posredovanju prek več prehodov ohraniti korelacijski identifikator zahteve od AAP do odgovora in vsakemu posredovanemu sporočilu dodeliti nov identifikator sporočila. (osnutek) | ICD v0.5 §4.2, §6.3 | M | PE | T |
| SI-GATE-FR-205 | Napake, prejete od drugega prehoda, mora prehod posredovati nespremenjene v običajni vrsti odgovora. (osnutek) | ICD v0.5 §11 | M | PE | T |

## 7.2 Storitve med prehodom in platformami (G2P, P2G)

### PU-P2G-1 Nalaganje in posodobitev identifikatorjev

- **Akterji:** slovenska platforma eFTI, prehod (register identifikatorjev).
- **Predpogoj:** platforma je v registru platform z veljavnim certifikacijskim statusom.
- **Potek (TGD §6.1):** ob aktivaciji sklopa podatkov platforma naloži UIL z identifikatorji; prehod preveri nabor in ga doda (nova UIL) ali zamenja (obstoječa UIL); zapis je takoj na voljo za iskanje.
- **Izjeme:** manjkajoči obvezni identifikatorji ali napačen format → zavrnitev celotnega nabora; platforma brez veljavnega statusa → zavrnitev.

### PU-P2G-2 Zaključek prevoza, deaktivacija in izbris

- **Potek:** platforma naloži dejanski datum dostave ali predaje (eFTI188; po TGD tudi eFTI596) → prehod zapis deaktivira in izbriše, razen pri cestnem prevozu (eFTI581 = 3), kjer ga hrani do izteka obdobja za kabotažo, nato izbriše.

### PU-G2P-1 Zahteva za sklop podatkov pri slovenski platformi

- **Potek (TGD §3.3.1, različici a in c):** prehod razbere UIL (lastni identifikator prehoda), razreši končno točko platforme (SMP/SML), preveri certifikacijski status in dostavi zahtevo s pravicami dostopa; platforma vrne le podsklope, za katere ima uradnik pravice.

### PU-G2P-2 Sporočilo o nadaljnjem ukrepanju platformi

- **Potek (TGD §3.3.4):** prehod dostavi sporočilo platformi, ki hrani sklop podatkov; platforma vrne potrdilo o prejemu in shranitvi, ki se po isti poti vrne uradniku.

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-210 | Prehod mora nabor identifikatorjev sprejeti le, če obstajajo vsi obvezni identifikatorji in so tip ter format skladni s skupnim naborom podatkov eFTI; sicer mora zavrniti celoten nabor in vrniti napako. | TGD §6.1 | M | RI | T |
| SI-GATE-FR-211 | Pri nalaganju za UIL, ki že obstaja, mora prehod nov nabor identifikatorjev zamenjati s starim (ne združiti); stari se ne hranijo, UIL se ne spremeni. | TGD §6.1 | M | RI | T |
| SI-GATE-FR-212 | Prehod mora zapis deaktivirati in izbrisati tudi ob posodobitvi identifikatorja eFTI596 (dejanski datum razkladanja), razen pri cestnem prevozu (SI-GATE-FR-155). (osnutek: TGD presega besedilo čl. 11(4)) | TGD §6.1 | P | RI | T |
| SI-GATE-FR-213 | Nabor identifikatorjev registra mora biti nastavljiv brez spremembe programske kode, da se lahko uvede razširjeni seznam iz TGD v1.0.1, tabela 4 (npr. eFTI617, eFTI450, eFTI146, eFTI583, eFTI908, eFTI162, eFTI596, eFTI917, eFTI1855), ko bo sprejeta sprememba IU 2024/1942. | TGD §6.4, tab. 4 | M | RI | D, T |
| SI-GATE-FR-214 | Prehod mora nalaganje identifikatorjev sprejeti le od platform z veljavnim certifikacijskim statusom v registru platform. | čl. 6(3)(f), 11(1) | M | RI, PE | T |
| SI-GATE-FR-215 | Prehod mora platformi posredovati pravice dostopa uradnika, tako da platforma lahko vrne le podsklope, za katere ima uradnik pravice. | čl. 4(2)(d)(iii); TGD §3.3.1 | M | PE | T |
| SI-GATE-FR-216 | Prehod mora pri zahtevi platformi upoštevati, da mora platforma odgovoriti v 50 s, tako da prehod izpolni 60 s; prehod, ki zahteva dostop, mora čakati 65 s. (osnutek) | ICD v0.5 §10 | M | PE | T |
| SI-GATE-FR-217 | Prehod ne sme zavrniti sklopa podatkov zaradi manjkajočih podatkov; o popolnosti odloči uradnik. Prehod preverja le skladnost ovojnice in glave sporočila s shemo. (osnutek) | ICD v0.5 §12 | M | PE | T |
| SI-GATE-FR-218 | Prehod mora od platforme sprejeti potrdilo o prejemu sporočila o nadaljnjem ukrepanju in ga posredovati AAP. | TGD §3.3.4 | M | PE | T |

## 7.3 Storitve identifikacije, avtentikacije in avtorizacije (IAA)

### PU-IAA-1 Prijava uradnika in pridobitev pravic

- **Akterji:** uradnik, uporabniška aplikacija, AAP, nacionalni gradnik e-identitete, register dovoljenj.
- **Potek:** prijava z nacionalnim sredstvom e-identifikacije → AAP pridobi pravice dostopa in obdelave iz registra dovoljenj → seja z omejenim trajanjem.

### PU-IAA-2 Strojna avtentikacija AAP in prehoda (M2M)

- **Potek:** AAP se prehodu predstavi s certifikatom iz registra AAP (čl. 6(3)(d)); prehod preveri ključ pri vsaki zahtevi (čl. 6(2)(a)(i)).

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-230 | AAP mora za identifikacijo uradnikov uporabljati nacionalne gradnike e-identitete (SI-PASS, SI-CAS, SIGEN-CA ali njihove naslednike); izbira se določi v pogl. 5.4. | čl. 4(3)(a); SI implementacijski načrt (20. 5. 2026) | P | AAP | P, T |
| SI-GATE-FR-231 | Med AAP in prehodom mora potekati medsebojna avtentikacija s certifikati (mTLS ali enakovredno) in preverjanje pravic pri vsaki zahtevi. | čl. 6(2)(a)(i), 6(3)(d) | M | PE, AAP | T |
| SI-GATE-FR-232 | Avtorizacijski žeton ali sporočilo, ki ga AAP posreduje prehodu, mora vsebovati sklice na pravice obdelave uradnika; prehod jih ne sme spreminjati. | čl. 4(2)(d)(iii) | M | AAP, PE | T |
| SI-GATE-FR-233 | Register dovoljenj mora biti mogoče vzdrževati prek programskega vmesnika (sinhronizacija s kadrovskimi evidencami pristojnih organov). | NL PvE §4.4 | P | RD | D |

## 7.4 Register identifikatorjev in iskanje

Zahteve za register so v 6.10 in 7.2; ta razdelek določa pravila iskanja.

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-240 | Pri sestavljenih iskalnih poljih (uporabljeno prevozno sredstvo, uporabljena ali prevažana prevozna oprema) mora iskanje zahtevati vse identifikatorje entitete skupaj (npr. eFTI617, eFTI618, eFTI620). | TGD §6.4 | M | IM | T |
| SI-GATE-FR-241 | Iskanje mora vrniti seznam celotnih zapisov (UIL in identifikatorji) aktivnih sklopov podatkov; register vrača le UIL, dostop do podatkov poteka kot v PU-G2P-1. | TGD §6 | M | IM, RI | T |
| SI-GATE-FR-242 | Iskanje mora biti enako pri iskanju slovenskega organa in pri iskanju, prejetem od drugega prehoda (enaka pravila uporabe iskalnih meril). | TGD §6.4 | M | IM | T |

## 7.5 Dostop pristojnih organov (vmesnik #3, CA2Gate in Gate2CA)

### PU-CA-1 Neposreden dostop prek UIL (TGD B2A UC1)

Uradnik skenira kodo QR z UIL → UA → AAP (preveri pravice, doda pravice dostopa) → prehod (lastna ali tuja platforma) → odgovor nazaj → UA prikaže le odobrene podsklope.

### PU-CA-2 Iskanje po identifikatorjih, asinhrono (TGD B2A UC2)

Uradnik išče npr. po registrski oznaki → prehod vrne lokalne zadetke takoj, zadetke drugih prehodov sproti → UA jih združi.

### PU-CA-3 Iskanje po identifikatorjih, sinhrono (TGD B2A UC3)

Kot PU-CA-2, a prehod zbere in združi vse rezultate in vrne en odgovor s statusi.

### PU-CA-4 Sporočilo o nadaljnjem ukrepanju (TGD B2A UC4)

Uradnik pripravi sporočilo z UIL → AAP preveri pravico → prehod dostavi platformi → potrdilo o prejemu nazaj uradniku.

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-250 | Prehod mora pristojnim organom zagotoviti programski vmesnik (#3) za PU-CA-1 do PU-CA-4 z javno, različicam podvrženo specifikacijo (npr. OpenAPI). | čl. 6(3)(b); ICD v0.5 §3.1 | M | PE (`vrata.caApi`) | P, T |
| SI-GATE-FR-251 | Vmesnik #3 mora podpirati asinhrono obdelavo: AAP ob zahtevi prejme identifikator in pozneje pridobi odgovor (poizvedovanje ali potisno obvestilo). Ali se dodatno zahteva sinhroni način, je odprto (7.8). | TGD §6.3; RI (REST API za organe) | M | PE | T |
| SI-GATE-FR-252 | Vmesnik #3 mora za podatke uporabljati standardne tipe sporočil eFTI (XSD), kjer je to mogoče. (osnutek) | ICD v0.5 P-01 | P | PE | P |
| SI-GATE-FR-253 | Vmesnik #3 mora omogočiti zahtevo za določeno različico sklopa podatkov, ki se prenese v kontekstu sporočila. (osnutek) | ICD v0.5 §13, P-06 | P | PE | T |

## 7.6 Upravljavska aplikacija in nadzor delovanja

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-270 | Upravljavska aplikacija mora omogočiti vodenje registra platform (edinstvena številka, varnostni ključi, certifikacijski status, kontaktni podatki), registra prehodov in registra AAP. | čl. 6(3)(d)–(f) | M | UP | D |
| SI-GATE-FR-271 | Certifikacijski status platform mora prehod samodejno usklajevati z Unijskim referenčnim seznamom ali nacionalnim seznamom imenovanega organa (predlog AG Union Registry: lokalna kopija, dnevna sinhronizacija). Mehanizem je odvisen od delegiranega akta o certificiranju (v sprejemanju). | čl. 6(2)(d)(i), 6(3)(f); AG Union Registry (Praga) | M | PE (`certCheck`), UP | T |
| SI-GATE-FR-272 | Upravljavska aplikacija mora podpirati postopek priklopa platforme, certificirane v drugi DČ (SI-GATE-FR-095), vključno z evidenco potrditve te DČ. | čl. 6(4) | M | UP | D |
| SI-GATE-FR-273 | Upravljavska aplikacija mora upravljavcem omogočiti pregled revizijskih sledi (SI-GATE-FR-077, 086) z iskanjem po številki zahteve, UIL, platformi, prehodu in času, z beleženjem vsakega vpogleda. | čl. 6(2)(c), 6(2)(g); TGD §9.4 | M | UP | D |
| SI-GATE-FR-274 | Prehod mora za nadzor delovanja oddajati metrike (razpoložljivost, odzivni časi, napake po vrstah, število zahtev po vmesnikih) in tehnične ter varnostne dogodke v sistem za nadzor delovanja. | TGD §9.2; TG1.3 (Praga) | M | PE, OP | D |
| SI-GATE-FR-275 | Upravljavska aplikacija mora omogočiti posodobitev skupnih šifrantov, kod napak in konfiguracije, dogovorjenih v mreži za operativno podporo (SI-GATE-FR-094). | čl. 6(3)(g) | M | UP | D |

## 7.7 Povezovalnik eDelivery

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-290 | Dostopna točka eDelivery mora delovati po profilu AS4 in konfiguraciji PMode iz TGD Annex 1 (tabela 13). | čl. 9(2); TGD Annex 1 | M | ED | T |
| SI-GATE-FR-291 | Za #1 (G2G) mora uporabljati statično odkrivanje, za #2 (G2P) dinamično odkrivanje prek SML/SMP. | čl. 9(2), 9(3) | M | ED | T |
| SI-GATE-FR-292 | Identifikatorji strank in končnih točk morajo slediti dogovorjenim pravilom poimenovanja (ICD v0.5 P-22; cutoff eDelivery 31. 10. 2026). (osnutek) | ICD v0.5 §6.1 | M | ED, OP | P |
| SI-GATE-FR-293 | Povezovalnik mora preslikati korelacijske identifikatorje v glavo AS4 (MessageId, ConversationId, RefToMessageId). (osnutek) | ICD v0.5 §8.4 | M | PE, ED | T |
| SI-GATE-FR-294 | Prehod mora podpirati nadgradnjo dostopne točke eDelivery (npr. na Domibus 2.x) brez spremembe vmesnikov #1 in #2. | Praga, Q&A DG MOVE (vpr. 14) | M | ED, OP | A |

## 7.8 Odprta vprašanja

1. **Način vmesnika #3:** samo asinhrono (kot RI) ali tudi sinhrono z združevanjem rezultatov (TGD §6.3).
2. **Omejeno iskanje:** ali ga Slovenija uporablja in s katerim seznamom držav (TGD §6.2).
3. **Profil REST za #2** kot nacionalna možnost (čl. 9(4), ICD P-02).
4. **Preverjanje certifikacijskega statusa:** model Unijskega referenčnega seznama ni dokončen (delegirani akt o certificiranju).
5. **Uskladitev z ICD v0.5:** pridobiti dokument in preveriti zahteve z oznako (osnutek).
