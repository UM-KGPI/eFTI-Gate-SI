# 9 Testiranje, prevzem in certifikacija

> **Zahteva:** TS javnega naročila, točka 2.4: izvedba vseh potrebnih testiranj (npr. TCP conformity test) ter postopka certifikacije in akreditacije
>
> **Viri:** Uredba (EU) 2020/1056 (čl. 11, 12); osnutek DU o certificiranju eFTI Platform (objavljen 21. 10. 2026, javno posvetovanje do 18. 11. 2026); TGD v1.0.1 §8.2–8.3; eFTI4LIVE: D2.1 (pilotni in testni načrt), D2.2, M2.3 (model PRA/TCT, 16. 11. 2026), akcijski načrt AG #5 (integracija eFTI Gate) in #8 (testiranje), CTG Security (Testfest), TG2.2 in TG2.3 (Praga, 19. 11. 2026)
>
> **Status:** osnutek v0.2 (19. 11. 2026), za interni pregled

## 9.0 Način zapisa

Zahteve v tem poglavju so `SI-GATE-NFR-2NN` (stolpci kot v 6.0). Poglavje določa, **kako** se preverijo zahteve iz pogl. 6–8: vsaka zahteva ima v Prilogi C način preverjanja (T, D, P, A), testni primeri pa se sklicujejo na oznako zahteve.

**Izhodišče.** Za eFTI Gate ni predvidene certifikacije skladnosti (TGD §8.2); certificirajo se le eFTI Platform. Skladnost eFTI Gate se zato dokazuje s testi: proti referenčni implementaciji (sidro skladnosti), v integracijskem omrežju z drugimi eFTI Gate in s tehničnimi testi skladnosti (TCT) v Launchpadu (TG2.2, Praga).

## 9.1 Strategija testiranja

| Raven | Namen | Okolje | Kdo izvaja | Dokaz |
|---|---|---|---|---|
| Testi enot in integracije | pravilnost komponent | razvojno, CI | izvajalec | poročila CI |
| Sistemski testi | zahteve pogl. 6–8 (vrsta preverjanja T) | testno | izvajalec | poročilo po zahtevah |
| Skladnost proti RI | vmesnika #1 in #2 skladna z EU (hub-and-spoke) | integracijsko omrežje eFTI4LIVE | izvajalec z MZIE | rezultati testov proti RI |
| TCT in varnostni testi | samodejno preverjanje skladnosti in znanih napadov | Launchpad (TG2.2) | izvajalec | podpisano poročilo |
| Interoperabilnost z drugimi eFTI Gate | izmenjava #1 z več eFTI Gate | integracijsko omrežje, Testfest | izvajalec, MZIE | zapisnik, rezultati |
| eFTI Gate–eFTI Platform | #2 s slovenskimi eFTI Platform | predprodukcijsko | izvajalec, ponudniki eFTI Platform | poročilo |
| Celovit test z organi | PU-CA-1 do 4 od UAP do eFTI Platform | predprodukcijsko | pristojni organi, izvajalec | zapisnik UAT |
| Zmogljivost in varnost | NFR 8.5, 8.8 | predprodukcijsko | izvajalec, neodvisni preizkuševalec | poročilo, poročilo o penetracijskem testu |
| Operativni prevzem | podpora, obnova, nadzor, postopki | produkcijsko | izvajalec, MZIE | zapisnik |

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-200 | Izvajalec mora v 30 dneh po podpisu pogodbe [predlog] predložiti testni načrt z ravnmi iz 9.1, testnimi primeri, povezanimi z oznakami zahtev (Priloga C), testnimi podatki, merili za uspeh in časovnico, usklajeno z integracijskim omrežjem eFTI4LIVE. | AG #8; [predlog] | M | OP | P |
| SI-GATE-NFR-201 | Vsaka zahteva z načinom preverjanja T ali D mora imeti vsaj en testni primer; poročilo o testiranju mora za vsako zahtevo navesti rezultat (uspešno, neuspešno, ni testirano) in dokaz. | Priloga C | M | OP | P |
| SI-GATE-NFR-202 | Avtomatizirani testi skladnosti z XSD in vmesniki #1–#3 morajo biti del CI in se izvesti ob vsaki spremembi (regresija). | SI-GATE-NFR-100 | M | OP | D |
| SI-GATE-NFR-203 | Izvajalec mora za teste uporabljati sintetične ali anonimizirane testne podatke; produkcijski podatki niso dovoljeni (SI-GATE-NFR-074). Nabor mora pokrivati vse eFTI data subsets iz DU 2024/2024, ki jih uporabljajo slovenski organi, in vse načine prevoza. | AG #8 (zbiranje nacionalnih testnih podatkov) | M | OP | P |

## 9.2 Testna okolja

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-210 | Izvajalec mora vzpostaviti ločena razvojno, testno, predprodukcijsko in produkcijsko okolje (SI-GATE-NFR-074); predprodukcijsko mora biti reprezentativno za produkcijo (SI-GATE-NFR-101). | NL PvE NF-31, NF-48 | M | OP | P, D |
| SI-GATE-NFR-211 | Testno ali predprodukcijsko okolje mora biti trajno povezano v integracijsko omrežje eFTI4LIVE (eDelivery Access Point, identifikator testnega eFTI Gate, certifikati) in dosegljivo vsaj v dogovorjenem obratovalnem času omrežja. | AG #5; TG2.3 (Praga) | M | ED, OP | D |
| SI-GATE-NFR-212 | Okolje mora vsebovati simulatorje eFTI Platform, tujih eFTI Gate in AAP (npr. iz RI) za samostojne in obremenitvene teste. | RI platform-gate-simulator; NL PvE NF-49 | M | OP | D |
| SI-GATE-NFR-213 | Izvajalec mora drugim eFTI Gate in slovenskim eFTI Platform objaviti podatke za priklop testnega eFTI Gate (URL dostopne točke, identifikator eFTI Gate, stranka, certifikati, podprta sporočila FTI, testni podatki, kontakt) po dogovorjenem viru informacij omrežja. | AG #5 (pričakovani rezultati) | M | OP | P |

## 9.3 Skladnost in interoperabilnost

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-220 | eFTI Gate mora pred vstopom v integracijsko mrežo eFTI Gate uspešno izvesti vse testne scenarije proti RI kot sidru skladnosti za vmesnik #1 (vse vrste sporočil, obe vlogi) in #2; napake se odpravijo pred priklopom drugih vozlišč. | TG2.2 (Praga, »hub-and-spoke«); SI-GATE-NFR-010 | M | EG, ED | T |
| SI-GATE-NFR-221 | eFTI Gate mora opraviti TCT in varnostne teste v Launchpadu (ali enakovrednem okolju, ki ga določi EK) in predložiti podpisano poročilo; po vsaki večji izdaji (nova različica XSD, sprememba vmesnikov) se testi ponovijo. | TG2.2 Launchpad (stalno zagotavljanje); SI-GATE-NFR-011 | M | EG | T |
| SI-GATE-NFR-222 | Izvajalec mora eFTI Gate prijaviti na prvo skupno testiranje (Testfest) integracijskega omrežja, ki se začne po zaključku faze F1, in na njem izvesti vse scenarije #1 in #2; udeležba in rezultati se dokumentirajo. | TG2.3 (Praga, časovnica integracije eFTI Gate) | M | OP | P |
| SI-GATE-NFR-223 | eFTI Gate mora pred produkcijo uspešno izmenjati realna sporočila (zahteve in odgovori, vključno z eDelivery) za vse vrste sporočil #1 z referenčnim eFTI Gate (RI) in vsaj enim drugim eFTI Gate DČ; cilj so vsaj trije eFTI Gate, med njimi sosednji (AT, IT, HR ali HU) [predlog]. Če drugi eFTI Gate do 15. 6. 2027 niso na voljo, lahko MZIE pisno odobri prevzem samo z RI. | AG #8; [predlog] | M | EG, ED | T |
| SI-GATE-NFR-224 | Testni scenariji morajo pokrivati teme delovne skupine za testiranje: vmesnike, odkrivanje in usmerjanje, pridobivanje podatkov in odgovore, dnevnike in sledljivost, napake, zanesljivost in obnovo. | Praga, AG #8 (16 podtem funkcionalnih testov) | M | OP | P |

## 9.4 Zmogljivostni in varnostni testi

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-240 | Izvajalec mora pred prevzemom izvesti obremenitvene teste z vnaprej dogovorjenimi merili (odzivni časi, konice, vzdržljivost, degradacija in obnova) na podlagi modela obremenitev iz M2; merila iz 8.8 morajo biti izpolnjena. | CTG Security (Performance track: »merimo, ne domnevamo«); SI-GATE-NFR-130–133 | M | EG | T |
| SI-GATE-NFR-241 | Varnostni testi morajo pokrivati vsaj: identiteto, zaupanje in pravice dostopa; preverjanje certifikatov AS4/TLS in preklic; zamenjavo ključev; zaščito sporočil in API; omejevanje hitrosti in DoS; negativne primere in zlorabe; revizijo in zaznavanje. | CTG Security (Testfest Security track; AG #8: 17 podtem) | M | EG, ED | T |
| SI-GATE-NFR-242 | Vsako tveganje visoke ali kritične stopnje iz ocene tveganj (SI-GATE-NFR-052) mora imeti testni primer in uspešen rezultat pred prevzemom. | CTG Security (»vsako kritično tveganje → testni primer«) | M | OP | P |
| SI-GATE-NFR-243 | Penetracijski test pred prevzemom (SI-GATE-NFR-090) mora vključevati vse zunanje vmesnike (#1, #2, #3, upravljavska aplikacija) in infrastrukturo gostovanja. | NL PvE NF-36 | M | OP | P |

## 9.5 Pilotno delovanje z organi in eFTI Platform

Slovenski pilot (MZIE in Trinet, eFTI4LIVE) predvideva cestni, železniški in multimodalni prevoz ter sodelovanje pristojnih organov, nacionalnega akreditacijskega organa in gospodarskih subjektov. Trinet v D2.1 poroča o treh pilotnih eFTI Platform (samostojna eFTI Platform, eCMR, letalski eAWB), ki predvidevajo povezavo z eFTI Gate.

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-250 | Izvajalec mora podpreti priklop vsaj ene slovenske eFTI Platform (npr. pilotna eFTI Platform eFTI4LIVE) v predprodukcijsko okolje in z njo izvesti PU-P2G-1, PU-P2G-2, PU-G2P-1 in PU-G2P-2. | SI pilot (D2.1, dec. 2025) | M | EG, ED | T |
| SI-GATE-NFR-251 | Izvajalec mora s pristojnimi organi izvesti uporabniški prevzemni test (UAT) PU-CA-1 do PU-CA-4 v predprodukcijskem okolju, vsaj za Policijo, FURS in IRSI [predlog], z izpolnjenim zapisnikom vsakega organa. | SI implementacijski načrt (pristojni organi); [predlog] | M | EG, AAP, UAP | T |
| SI-GATE-NFR-252 | Izvajalec mora podpreti pilotne scenarije z več načini prevoza (cesta, železnica, multimodalno) iz slovenskega pilota in za vsakega predložiti rezultate. | SI pilot (D2.1) | P | EG | T |
| SI-GATE-NFR-253 | Rezultati pilotov morajo biti pripravljeni tako, da jih MZIE lahko poroča v eFTI4LIVE (T2.4: kazalniki, npr. število pilotov eFTI Gate–organ, eFTI Gate–eFTI Gate, eFTI Gate–eFTI Platform). | T2.4 (Praga, KPI) | M | OP | P |

## 9.6 Prevzem

Prevzem poteka v fazah. Vstop v naslednjo fazo je mogoč le, ko so izpolnjena merila prejšnje faze.

| Faza | Vstopni pogoj | Izstopno merilo |
|---|---|---|
| F1 Sistemski prevzem | testni načrt potrjen | vse zahteve M izdaje R1 (pogl. 10.5) z načinom T/D uspešne v testnem okolju; brez odprtih napak kritične ali visoke stopnje |
| F2 Skladnost in interoperabilnost | F1 | SI-GATE-NFR-220, 221, 223 izpolnjene |
| F3 Uporabniški prevzem | F2 | SI-GATE-NFR-250, 251 izpolnjene; zapisniki organov |
| F4 Operativni prevzem | F3, penetracijski test brez odprtih kritičnih ugotovitev | preizkus obnove, nadzor in alarmi delujejo, služba za pomoč deluje, dokumentacija predana |
| F5 Poskusno obratovanje | produkcijski zagon | 30 dni [predlog] brez kršitve SLA zaradi izvajalca |
| Končni prevzem | F5 | podpisan zapisnik o končnem prevzemu |

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-260 | Prevzem mora potekati po fazah F1–F5 in končnem prevzemu iz 9.6; vsaka faza se zaključi s pisnim zapisnikom, ki ga potrdi MZIE. | [predlog] | M | OP | P |
| SI-GATE-NFR-261 | Napake se razvrščajo v kritične, visoke, srednje in nizke [predlog]; za vstop v naslednjo fazo ne sme biti odprtih kritičnih ali visokih napak, srednje morajo imeti dogovorjen rok odprave. | NL PvE NF-64; [predlog] | M | OP | P |
| SI-GATE-NFR-262 | Produkcijski zagon (konec F4) mora biti najpozneje 9. 7. 2027; časovnica faz se uskladi z integracijskim omrežjem (zaključek tehničnih specifikacij 31. 12. 2026, operativnih 31. 3. 2027) v pogl. 10. | TG2.3 (Praga); SI-GATE-NFR-153 | M | OP | P |
| SI-GATE-NFR-263 | Ob prevzemu mora izvajalec predati: izvorno kodo, namestitvene artefakte, konfiguracijo, arhitekturni opis (C4), navodila za upravljanje in uporabo, testna poročila, poročilo o penetracijskem testu in poročilo TCT. | NL PvE NF-45, NF-83; SI-GATE-NFR-150 | M | OP | P |

## 9.7 Priklop eFTI Platform, certificiranje in akreditacija

**Pravni okvir.** Certificirajo se eFTI Platform in eFTI Service Provider (čl. 11–12 Uredbe (EU) 2020/1056); organe za ugotavljanje skladnosti akreditira nacionalni akreditacijski organ (v Sloveniji Slovenska akreditacija), certifikacijske zahteve pa določa delegirani akt (osnutek objavljen 21. 10. 2026). eFTI Gate sam ni certificiran (TGD §8.2), mora pa pred vsako izmenjavo z eFTI Platform preveriti njen certifikacijski status (čl. 6(2)(d)(i)).

**Časovni okvir.** Po M2.3 je sprejetje delegiranega akta pričakovati konec 2026 ali v začetku 2027, akreditacijo prvih organov približno leto pozneje in prve certifikate še pol leta pozneje (Praga: »ne pred sredino 2028«). Ob zagonu 9. 7. 2027 zato verjetno ne bo nobene certificirane eFTI Platform.

**Vmesna rešitev PRA.** eFTI4LIVE predlaga Platform Readiness Assessment (PRA): priklop eFTI Platform na podlagi poročila TCT (in samoizjave) do formalne certifikacije. Države članice so glede PRA razdeljene (pravna podlaga, odgovornost); odločitev je nacionalna. Model M2.3 predvideva, da vsaka DČ izvaja TCT **pri svojem eFTI Gate** (decentraliziran model), z enotnimi scenariji, ki jih pripravi TG2.5 in pregleda EK.

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-280 | eFTI Gate mora imeti postopek priklopa eFTI Platform (onboarding): vloga upravljavca eFTI Platform, preverjanje identitete in certifikacijskega statusa, izmenjava certifikatov, test povezave, vpis v Registry of eFTI Platforms (SI-GATE-FR-093, FR-270). | čl. 6(3)(f); TGD §8.3 | M | UP, OP | D |
| SI-GATE-NFR-281 | eFTI Gate mora zagotoviti okolje, v katerem eFTI Platform pred priklopom izvede usklajene testne scenarije TCT za vmesnik #2 in pridobi poročilo TCT, ko bodo specifikacije TCT EK/eDANOS na voljo; do takrat najmanj test povezave s scenariji PU-P2G in PU-G2P. | M2.3 (decentraliziran TCT); osnutek DU o certificiranju | M | EG, TCT | D |
| SI-GATE-NFR-282 | eFTI Gate mora tehnično podpirati priklop eFTI Platform glede na status v Registry of eFTI Platforms: »certificirana« in, če MZIE tako odloči, »PRA« (poročilo TCT brez certifikata); politika priklopa mora biti nastavljiva brez spremembe kode. | M2.3; Praga (pismo EK, stališča DČ) | M | EG, UP | D |
| SI-GATE-NFR-283 | eFTI Gate mora spremljati delež napak v izmenjavi s posamezno eFTI Platform (format, obvezna polja, protokol) in ob preseženem pragu obvestiti upravljavca ter omogočiti začasni odklop eFTI Platform. | M2.3 (spremljanje v produkciji) | M | EG, UP | T |
| SI-GATE-NFR-284 | Registry of eFTI Platforms mora podpirati postopek iz čl. 6(4) za eFTI Platform, certificirane v drugih DČ (SI-GATE-FR-095, FR-272). | čl. 6(4) | M | UP | D |

## 9.8 Odprta vprašanja za MZIE

1. **PRA:** ali bo Slovenija pred formalno certifikacijo priklopila eFTI Platform na podlagi poročila TCT.
2. **Izvajanje TCT pri eFTI Gate:** kdo upravlja okolje TCT (izvajalec eFTI Gate, MZIE ali tretja oseba) in ali je del tega JN.
3. **Obseg UAT:** kateri pristojni organi sodelujejo v uporabniškem prevzemu in s katerimi aplikacijami (odvisno od M2: AAP v eFTI Gate ali pri organih).
4. **Val priklopa v integracijsko omrežje:** ob podpisu pogodbe za gradnjo aprila 2027 (osnovni scenarij, pogl. 10.3) bo Slovenija verjetno v drugem valu priklopa (TG2.3: paket za drugi val držav aprila 2027; prvi val, 10+ DČ, decembra 2026), za Testfest 4 (marec 2027) pa verjetno še ne bo pripravljena. To je tveganje za rok 9. 7. 2027 (pogl. 10).
5. **Vloga Slovenske akreditacije** in imenovanega organa za nacionalni seznam certificiranih eFTI Platform po sprejetju delegiranega akta.
