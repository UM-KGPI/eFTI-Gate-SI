# 7 Primeri uporabe in storitve

> **Zahteva:** storitve eFTI Gate do drugih eFTI Gate, eFTI Platform, pristojnih organov
>
> **Viri:** TGD v1.0.1 (izvoz 9. 9. 2026, v pregledu) §3.3, §6, §7; ICD v0.4 in povzetek ICD v0.5 (Praga, 19. 11. 2026); referenčna implementacija eFTI Gate (RI); NL PvE pogl. 3–7
>
> **Status:** osnutek v0.2 (19. 11. 2026), za interni pregled

## 7.0 Način zapisa

Vsak primer uporabe (PU) navaja akterje, predpogoje, glavni potek, izjeme in zahteve. Zahteve v tem poglavju (`SI-GATE-FR-2NN`) podrobneje določajo zahteve iz pogl. 6 na podlagi tehničnih smernic in ICD; vir je naveden pri vsaki zahtevi. Stolpci P, Komp. in Preverjanje imajo pomen iz 6.0.

**Stabilnost virov.** TGD v1.0.1 je v pregledu, ICD v0.5 je osnutek (zahteve se sklicujejo na povzetek, predstavljen na konzorcijskem sestanku 19. 11. 2026), shema XSD je v različici 1.0.0 Beta (izdaja 1.0 napovedana za pomlad 2027). Zahteve, ki se sklicujejo na te vire, so označene z **(osnutek)** in jih je treba pred oddajo M3 preveriti glede na takrat veljavne verzije.

**Vloge eFTI Gate.** V vsakem PU je slovenski eFTI Gate lahko *requesting eFTI Gate* (zahteva slovenskega organa) ali *receiving eFTI Gate* (zahteva tujega eFTI Gate za podatke na slovenski eFTI Platform). Obe vlogi sta obvezni.

**Vmesniki** (ICD v0.5 §3.1, osnutek): #1 eFTI Gate–eFTI Gate (G2G) in #2 eFTI Gate–eFTI Platform (G2P) sta normativna na ravni EU; #3 eFTI Gate–AAP (G2A) je nacionalna izbira in ga določa ta TS.

## 7.1 Storitve med eFTI Gate (G2G)

### PU-G2G-1 Posredovanje zahteve za dostop prek UIL tujemu eFTI Gate

- **Akterji:** slovenski eFTI Gate (zahteva dostop), tuji eFTI Gate (prejme zahtevo), tuja eFTI Platform.
- **Predpogoj:** odobrena zahteva AAP z UIL; tuji eFTI Gate je v register eFTI Gate (SI-GATE-FR-092).
- **Potek (TGD §3.3.1, različica b):** (1) eFTI Gate razbere UIL in ugotovi, da identifikator ciljnega eFTI Gate ni njegov; (2) poišče končno točko ciljnega eFTI Gate (statično odkrivanje) in posreduje zahtevo prek eDelivery; (3) tuji eFTI Gate jo dostavi eFTI Platform; (4) odgovor se vrne po isti poti; (5) slovenski eFTI Gate preveri ključ tujega eFTI Gate in odgovor posreduje AAP.
- **Izjeme:** neznan identifikator eFTI Gate; neveljaven ključ; potek časa (60 s); napaka tujega eFTI Gate (posreduje se nespremenjena).

### PU-G2G-2 Obdelava zahteve tujega eFTI Gate (receiving eFTI Gate)

- **Potek:** prejem prek eDelivery → preverjanje ključa pošiljatelja (FR-074) → razrešitev eFTI Platform iz UIL → preverjanje certifikacijskega statusa eFTI Platform → dostava eFTI Platform → odgovor po isti poti.

### PU-G2G-3 Iskanje po identifikatorjih v omrežju eFTI Gate

- **Potek (TGD §3.3.2–3.3.3, §6.2–6.3):** slovenski eFTI Gate poišče zadetke v svojem Registry of Identifiers in zahtevo posreduje drugim eFTI Gate; zbere njihove odgovore in jih posreduje AAP sproti (asinhrono) ali jih združi (sinhrono).
- **Obratna smer:** slovenski eFTI Gate mora odgovoriti na vsako iskanje drugega eFTI Gate, ne glede na to, ali ta eFTI Gate uporablja omejeno iskanje.

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-200 | eFTI Gate mora podpirati obe vlogi, requesting eFTI Gate in receiving eFTI Gate, za vse vrste sporočil (zahteva prek UIL, iskanje po identifikatorjih, follow-up communication). | čl. 1(13), 1(14); TGD §3.3 | M | EG | T |
| SI-GATE-FR-201 | eFTI Gate mora iskanje po identifikatorjih posredovati vsem eFTI Gate v registru eFTI Gate drugih DČ; kot nastavljivo možnost mora podpirati omejeno iskanje na izbrane države (seznam ali izbira v UAP). | TGD §6.2 | M | EG, SM | T |
| SI-GATE-FR-202 | eFTI Gate mora odgovoriti na vsako iskanje, ki ga prejme od drugega eFTI Gate. | TGD §6.2 | M | EG, SM | T |
| SI-GATE-FR-203 | Pri sinhronem načinu mora eFTI Gate delne rezultate združiti v en odgovor s statusom vsakega eFTI Gate (COMPLETE, ERROR, PENDING, TIMEOUT, UNAUTHORISED); pri asinhronem jih mora posredovati AAP takoj ob prejemu. Kateri način (ali oba) uporablja vmesnik #3, določi 7.5. | TGD §6.3 | M | EG | T |
| SI-GATE-FR-204 | eFTI Gate mora pri posredovanju prek več eFTI Gate ohraniti korelacijski identifikator zahteve od AAP do odgovora in vsakemu posredovanemu sporočilu dodeliti nov identifikator sporočila. (osnutek) | ICD v0.5 §4.2, §6.3 | M | EG | T |
| SI-GATE-FR-205 | Napake, prejete od drugega eFTI Gate, mora eFTI Gate posredovati nespremenjene v običajni vrsti odgovora. (osnutek) | ICD v0.5 §11 | M | EG | T |

## 7.2 Storitve med eFTI Gate in eFTI Platform (G2P, P2G)

### PU-P2G-1 Nalaganje in posodobitev identifikatorjev

- **Akterji:** slovenska eFTI Platform, eFTI Gate (Registry of Identifiers).
- **Predpogoj:** eFTI Platform je v Registry of eFTI Platforms z veljavnim certifikacijskim statusom.
- **Potek (TGD §6.1):** ob aktivaciji eFTI dataset eFTI Platform naloži UIL z identifikatorji; eFTI Gate preveri nabor in ga doda (nova UIL) ali zamenja (obstoječa UIL); zapis je takoj na voljo za iskanje.
- **Izjeme:** manjkajoči obvezni identifikatorji ali napačen format → zavrnitev celotnega nabora; eFTI Platform brez veljavnega statusa → zavrnitev.

### PU-P2G-2 Zaključek prevoza, deaktivacija in izbris

- **Potek:** eFTI Platform naloži dejanski datum dostave ali predaje (eFTI188; po TGD tudi eFTI596) → eFTI Gate zapis deaktivira in izbriše, razen pri cestnem prevozu (eFTI581 = 3), kjer ga hrani do izteka obdobja za kabotažo, nato izbriše.

### PU-G2P-1 Zahteva za eFTI dataset pri slovenski eFTI Platform

- **Potek (TGD §3.3.1, različici a in c):** eFTI Gate razbere UIL (lastni identifikator eFTI Gate), razreši končno točko eFTI Platform (SMP/SML), preveri certifikacijski status in dostavi zahtevo s pravicami dostopa; eFTI Platform vrne le eFTI data subsets, za katere ima uradnik pravice.

### PU-G2P-2 follow-up communication eFTI Platform

- **Potek (TGD §3.3.4):** eFTI Gate dostavi sporočilo eFTI Platform, ki hrani eFTI dataset; eFTI Platform vrne potrdilo o prejemu in shranitvi, ki se po isti poti vrne uradniku.

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-210 | eFTI Gate mora nabor identifikatorjev sprejeti le, če obstajajo vsi obvezni identifikatorji in so tip ter format skladni z eFTI common data set; sicer mora zavrniti celoten nabor in vrniti napako. | TGD §6.1 | M | RoI | T |
| SI-GATE-FR-211 | Pri nalaganju za UIL, ki že obstaja, mora eFTI Gate stari nabor identifikatorjev zamenjati z novim (ne združiti); stari se ne hranijo, UIL se ne spremeni. | TGD §6.1 | M | RoI | T |
| SI-GATE-FR-212 | eFTI Gate mora zapis deaktivirati in izbrisati tudi ob posodobitvi identifikatorja eFTI596 (dejanski datum razkladanja), razen pri cestnem prevozu (SI-GATE-FR-155). (osnutek: TGD presega besedilo čl. 11(4)) | TGD §6.1 | P | RoI | T |
| SI-GATE-FR-213 | Nabor identifikatorjev registra mora biti nastavljiv brez spremembe programske kode, da se lahko uvede razširjeni seznam iz TGD v1.0.1, tabela 4 (npr. eFTI617, eFTI450, eFTI146, eFTI583, eFTI908, eFTI162, eFTI596, eFTI917, eFTI1855), ko bo sprejeta sprememba IU 2024/1942. | TGD §6.4, tab. 4 | M | RoI | D, T |
| SI-GATE-FR-214 | eFTI Gate mora nalaganje identifikatorjev sprejeti le od eFTI Platform z veljavnim certifikacijskim statusom v Registry of eFTI Platforms. | čl. 6(3)(f), 11(1) | M | RoI, EG | T |
| SI-GATE-FR-215 | eFTI Gate mora eFTI Platform posredovati pravice dostopa uradnika, tako da eFTI Platform lahko vrne le eFTI data subsets, za katere ima uradnik pravice. | čl. 4(2)(d)(iii); TGD §3.3.1 | M | EG | T |
| SI-GATE-FR-216 | Časovniki se merijo od trenutka potrditve prejema zahteve: eFTI Platform mora odgovoriti v 50 s; receiving eFTI Gate pošlje »ni odgovora« po 60 s (SI-GATE-FR-085); requesting eFTI Gate čaka 65 s od potrditve prejema s strani receiving eFTI Gate, da lahko prejme njegovo sporočilo »ni odgovora«, nato sam izda »ni odgovora«. (osnutek) | ICD v0.5 §10 | M | EG | T |
| SI-GATE-FR-217 | eFTI Gate ne sme zavrniti eFTI dataset zaradi manjkajočih podatkov; o popolnosti odloči uradnik. eFTI Gate preverja le skladnost ovojnice in glave sporočila s shemo. (osnutek) | ICD v0.5 §12 | M | EG | T |
| SI-GATE-FR-218 | eFTI Gate mora od eFTI Platform sprejeti potrdilo o prejemu follow-up communication in ga posredovati AAP. | TGD §3.3.4 | M | EG | T |

## 7.3 Storitve identifikacije, avtentikacije in avtorizacije (IAA)

### PU-IAA-1 Prijava uradnika in pridobitev pravic

- **Akterji:** uradnik, UAP, AAP, nacionalni gradnik e-identitete, Authorisation Registry.
- **Potek:** prijava z nacionalnim sredstvom e-identifikacije → AAP pridobi pravice dostopa in obdelave iz Authorisation Registry → seja z omejenim trajanjem.

### PU-IAA-2 Strojna avtentikacija AAP in eFTI Gate (M2M)

- **Potek:** AAP se eFTI Gate predstavi s certifikatom iz registra AAP (čl. 6(3)(d)); eFTI Gate preveri ključ pri vsaki zahtevi (čl. 6(2)(a)(i)).

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-230 | AAP mora za identifikacijo uradnikov uporabljati nacionalne gradnike e-identitete (SI-PASS, SI-CAS, SIGEN-CA ali njihove naslednike); izbira je odprta (odloči se v pogl. 5.4, v pripravi). | čl. 4(3)(a); SI implementacijski načrt (20. 5. 2026) | P | AAP | P, T |
| SI-GATE-FR-231 | Med AAP in eFTI Gate mora potekati medsebojna avtentikacija s certifikati (mTLS ali enakovredno) in preverjanje pravic pri vsaki zahtevi. | čl. 6(2)(a)(i), 6(3)(d) | M | EG, AAP | T |
| SI-GATE-FR-232 | Avtorizacijski žeton ali sporočilo, ki ga AAP posreduje eFTI Gate, mora vsebovati sklice na pravice obdelave uradnika; eFTI Gate jih ne sme spreminjati. | čl. 4(2)(d)(iii) | M | AAP, EG | T |
| SI-GATE-FR-233 | Authorisation Registry mora biti mogoče vzdrževati prek programskega vmesnika (sinhronizacija s kadrovskimi evidencami pristojnih organov). | NL PvE §4.4 | P | AR | D |

## 7.4 Registry of Identifiers in iskanje

Zahteve za register so v 6.10 in 7.2; ta razdelek določa pravila iskanja.

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-240 | Pri sestavljenih iskalnih poljih (uporabljeno prevozno sredstvo, uporabljena ali prevažana prevozna oprema) mora iskanje zahtevati vse identifikatorje entitete skupaj (npr. uporabljena prevozna oprema: eFTI378, eFTI374, eFTI578, eFTI987 iz čl. 11(3)). | TGD §6.4 | M | SM | T |
| SI-GATE-FR-241 | Iskanje mora vrniti seznam celotnih zapisov (UIL in identifikatorji) aktivnih eFTI dataset; register vrača le UIL, dostop do podatkov poteka kot v PU-G2P-1. | TGD §6 | M | SM, RoI | T |
| SI-GATE-FR-242 | Iskanje mora biti enako pri iskanju slovenskega organa in pri iskanju, prejetem od drugega eFTI Gate (enaka pravila uporabe iskalnih meril). | TGD §6.4 | M | SM | T |

## 7.5 Dostop pristojnih organov (vmesnik #3, CA2Gate in Gate2CA)

### PU-CA-1 Neposreden dostop prek UIL (TGD B2A UC1)

Uradnik skenira kodo QR z UIL → UAP → AAP (preveri pravice, doda pravice dostopa) → eFTI Gate (lastna ali tuja eFTI Platform) → odgovor nazaj → UAP prikaže le odobrene eFTI data subsets.

### PU-CA-2 Iskanje po identifikatorjih, asinhrono (TGD B2A UC2)

Uradnik išče npr. po registrski oznaki → eFTI Gate vrne lokalne zadetke takoj, zadetke drugih eFTI Gate sproti → UAP jih združi.

### PU-CA-3 Iskanje po identifikatorjih, sinhrono (TGD B2A UC3)

Kot PU-CA-2, a eFTI Gate zbere in združi vse rezultate in vrne en odgovor s statusi.

### PU-CA-4 follow-up communication (TGD B2A UC4)

Uradnik pripravi sporočilo z UIL → AAP preveri pravico → eFTI Gate dostavi eFTI Platform → potrdilo o prejemu nazaj uradniku.

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-250 | eFTI Gate mora pristojnim organom zagotoviti programski vmesnik (#3) za PU-CA-1 do PU-CA-4 z javno, različicam podvrženo specifikacijo (npr. OpenAPI). | čl. 6(3)(b); ICD v0.5 §3.1 | M | EG (`vrata.caApi`) | P, T |
| SI-GATE-FR-251 | Vmesnik #3 mora podpirati asinhrono obdelavo: AAP ob zahtevi prejme identifikator in pozneje pridobi odgovor (poizvedovanje ali potisno obvestilo). Ali se dodatno zahteva sinhroni način, je odprto (7.8). | TGD §6.3; RI (REST API za organe) | M | EG | T |
| SI-GATE-FR-252 | Vmesnik #3 mora za podatke uporabljati standardne tipe sporočil eFTI (XSD), kjer je to mogoče. (osnutek) | ICD v0.5 P-01 | P | EG | P |
| SI-GATE-FR-253 | Vmesnik #3 mora omogočiti zahtevo za določeno različico eFTI dataset, ki se prenese v kontekstu sporočila. (osnutek) | ICD v0.5 §13, P-06 | P | EG | T |

## 7.6 Upravljavska aplikacija in nadzor delovanja

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-270 | Upravljavska aplikacija mora omogočiti vodenje Registry of eFTI Platforms (edinstvena številka, varnostni ključi, certifikacijski status, kontaktni podatki), registra eFTI Gate drugih DČ in registra AAP. | čl. 6(3)(d)–(f) | M | UP | D |
| SI-GATE-FR-271 | Certifikacijski status eFTI Platform mora eFTI Gate samodejno usklajevati z Unijskim referenčnim seznamom ali nacionalnim seznamom imenovanega organa (predlog AG Union Registry: lokalna kopija, dnevna sinhronizacija). Mehanizem je odvisen od delegiranega akta o certificiranju (v sprejemanju). | čl. 6(2)(d)(i), 6(3)(f); AG Union Registry (Praga) | M | EG (`certCheck`), UP | T |
| SI-GATE-FR-272 | Upravljavska aplikacija mora podpirati postopek priklopa eFTI Platform, certificirane v drugi DČ (SI-GATE-FR-095), vključno z evidenco potrditve te DČ. | čl. 6(4) | M | UP | D |
| SI-GATE-FR-273 | Upravljavska aplikacija mora upravljavcem omogočiti pregled revizijskih sledi (SI-GATE-FR-077, 086) z iskanjem po številki zahteve, UIL, eFTI Platform, eFTI Gate in času, z beleženjem vsakega vpogleda. | čl. 6(2)(c), 6(2)(g); TGD §9.4 | M | UP | D |
| SI-GATE-FR-274 | eFTI Gate mora za nadzor delovanja oddajati metrike (razpoložljivost, odzivni časi, napake po vrstah, število zahtev po vmesnikih) in tehnične ter varnostne dogodke v sistem za nadzor delovanja. | TGD §9.2; TG1.3 (Praga) | M | EG, OP | D |
| SI-GATE-FR-275 | Upravljavska aplikacija mora omogočiti posodobitev skupnih šifrantov, kod napak in konfiguracije, dogovorjenih v mreži za operativno podporo (SI-GATE-FR-094). | čl. 6(3)(g) | M | UP | D |

## 7.7 Povezovalnik eDelivery

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-290 | eDelivery Access Point mora delovati po profilu AS4 in konfiguraciji PMode iz TGD Annex 1 (tabela 13). | čl. 9(2); TGD Annex 1 | M | ED | T |
| SI-GATE-FR-291 | Za #1 (G2G) mora uporabljati statično odkrivanje, za #2 (G2P) dinamično odkrivanje prek SML/SMP. | čl. 9(2), 9(3) | M | ED | T |
| SI-GATE-FR-292 | Identifikatorji strank in končnih točk morajo slediti dogovorjenim pravilom poimenovanja (ICD v0.5 P-22; cutoff eDelivery 31. 10. 2026). (osnutek) | ICD v0.5 §6.1 | M | ED, OP | P |
| SI-GATE-FR-293 | Povezovalnik mora preslikati korelacijske identifikatorje v glavo AS4 (MessageId, ConversationId, RefToMessageId). (osnutek) | ICD v0.5 §8.4 | M | EG, ED | T |
| SI-GATE-FR-294 | eFTI Gate mora podpirati nadgradnjo eDelivery Access Point (npr. na Domibus 2.x) brez spremembe vmesnikov #1 in #2. | Praga, Q&A DG MOVE (vpr. 14) | M | ED, OP | A |

## 7.8 Odprta vprašanja

1. **Način vmesnika #3:** samo asinhrono (kot RI) ali tudi sinhrono z združevanjem rezultatov (TGD §6.3).
2. **Omejeno iskanje:** ali ga Slovenija uporablja in s katerim seznamom držav (TGD §6.2).
3. **Profil REST za #2** kot nacionalna možnost (čl. 9(4), ICD P-02).
4. **Preverjanje certifikacijskega statusa:** model Unijskega referenčnega seznama ni dokončen (delegirani akt o certificiranju).
5. **Uskladitev z ICD v0.5:** pridobiti dokument in preveriti zahteve z oznako (osnutek).
