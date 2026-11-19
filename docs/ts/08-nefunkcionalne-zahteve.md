# 8 Nefunkcionalne zahteve

> **Zahteva:** kakovost delovanja eFTI Gate
>
> **Viri:** IU 2024/1942 (čl. 6, 10, 12); TGD v1.0.1 (v pregledu) §8 varnost, §9 dnevniki, §10 služba za pomoč; CTG Security, Authorisation & Testing (jun. 2026); TG1.3 eFTI governance (Praga, 18. 11. 2026); ICD v0.5 (povzetek, Praga); NL PvE pogl. 8; ZInfV-1 (Uradni list RS, št. 40/25); Uredba (EU) 2016/679 (GDPR) in ZVOP-2
>
> **Status:** osnutek v0.2 (19. 11. 2026), za interni pregled

## 8.0 Način zapisa

Oznake so `SI-GATE-NFR-NNN`; stolpci P, Komp. in Preverjanje imajo pomen iz 6.0. Številske vrednosti so dveh vrst:

- **vrednost iz vira** (uredba, TGD, ICD), navedena v stolpcu Vir;
- **[predlog]** – vrednost, ki jo predlagamo, ker je EU ne določa; o njej odloči MZIE (zbirno v 8.11). Do odločitve jih v razpisni dokumentaciji ne smemo navesti kot dokončne.

Razdelki 8.1–8.7 sledijo strukturi iz osnutka v0.1; 8.8–8.10 so dodani po zgledu NL PvE (8.8–8.10), ker jih javno naročilo potrebuje (zmogljivost, poročanje, lastništvo kode).

**Izhodišče varnosti.** TGD v1.0.1 §8 obravnava predvsem varnost eFTI Gate; varnost AAP in UAP v celoti prepušča državam članicam, za eFTI Gate pa ni predvidene certifikacije skladnosti (TGD §8.2). CTG Security ta področja navaja kot vrzeli prve prioritete. Zato so v 8.5 nacionalne zahteve podrobnejše od EU.

## 8.1 Razpoložljivost

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-001 | eFTI Gate mora delovati neprekinjeno (24/7/365), ker nadzor prevozov poteka ves čas. | NL PvE NF-1; čl. 3(3)(d) | M | EG, ED | A, T |
| SI-GATE-NFR-002 | Mesečna razpoložljivost storitev eFTI Gate (vmesniki #1, #2, #3) mora znašati vsaj **99,5 %** [predlog]; vnaprej napovedana vzdrževalna okna (SI-GATE-NFR-003) se ne štejejo v nerazpoložljivost, če skupaj ne presežejo **4 ur** mesečno [predlog]. Ciljna vrednost EU še ni določena (TG1.3: 99,9 % ocenjeno kot nerealno). | TG1.3 (Praga); [predlog] | M | EG, OP | A |
| SI-GATE-NFR-003 | Načrtovano vzdrževanje mora biti napovedano vsaj en delovni dan vnaprej uporabnikom in drugim eFTI Gate po dogovorjenih kanalih mreže za operativno podporo. | TG1.3 (Praga) | M | OP | P |
| SI-GATE-NFR-004 | Registry of eFTI Platforms (preverjanje certifikata in certifikacijskega statusa) mora odgovoriti na poizvedbo eFTI Gate v največ 2 s in imeti mesečno razpoložljivost vsaj 99,9 % (vrednost iz TGD §8.3). | TGD §8.3 | M | EG, UP | T |
| SI-GATE-NFR-005 | Rešitev mora imeti načrt neprekinjenega poslovanja in obnove po katastrofi s ciljnim časom obnove (RTO) **4 ure** in ciljno točko obnove (RPO) **15 minut** [predlog] za Registry of Identifiers in revizijske sledi. | NL PvE NF-15; [predlog] | M | OP | P, D |

## 8.2 Interoperabilnost

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-010 | eFTI Gate mora pred priklopom v produkcijsko omrežje eFTI Gate uspešno opraviti teste skladnosti proti referenčni implementaciji v integracijskem omrežju eFTI4LIVE (hub-and-spoke); rezultati so pogoj za prevzem (pogl. 9). | TG2.2 (Praga), ADR-0002 | M | EG, ED | T |
| SI-GATE-NFR-011 | eFTI Gate mora opraviti tehnične teste skladnosti (TCT) in varnostne teste, ki jih zagotavlja EK oziroma Launchpad, in predložiti podpisano poročilo. | TG2.2 Launchpad (Praga); D2.2 | M | EG | T |
| SI-GATE-NFR-012 | eFTI Gate mora hkrati podpirati vsaj dve zaporedni veljavni različici sheme XSD v prehodnem obdobju po izdaji nove različice [predlog]; izbiro različice in pretvorbo za organe ureja ICD §13 (osnutek). | ICD v0.5 §13; AG Gate integration (odprto vpr.) | M | EG | T |
| SI-GATE-NFR-013 | Izvajalec mora v 3 mesecih [predlog] po izdaji nove obvezne različice XSD ali sprememb TGD/ICD, ki jih sprejme mreža za operativno podporo, uvesti spremembe v produkcijo, razen če EK določi drug rok. | čl. 6(3)(g), 13; [predlog] | M | OP | P |
| SI-GATE-NFR-014 | Specifikacija vmesnika #3 (in morebitnega profila REST za #2) mora biti objavljena v strojno berljivi obliki (OpenAPI 3.x) z različicami in zgodovino sprememb. | čl. 9(4); ICD v0.5 §9 | M | EG | P |

## 8.3 Uporabnost

Velja za uporabniške vmesnike v obsegu JN (upravljavska aplikacija; UAP in AAP po M2).

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-020 | Uporabniški vmesniki, pomoč in uporabniška dokumentacija morajo biti v slovenskem jeziku; tehnična dokumentacija vmesnikov tudi v angleškem. | NL PvE NF-7; [predlog] | M | UP, UAP | P |
| SI-GATE-NFR-021 | Spletni uporabniški vmesniki morajo izpolnjevati zahteve dostopnosti WCAG 2.1, raven AA (standard EN 301 549), skladno z nacionalnimi predpisi o dostopnosti spletišč javnega sektorja; skladnost se dokaže z neodvisnim pregledom. | NL PvE NF-8–10; [preveriti: veljavni nacionalni predpis] | M | UP, UAP | P |
| SI-GATE-NFR-022 | UAP mora delovati na mobilnih napravah, ki jih uporabljajo nadzorniki na terenu (branje kode QR z UIL), in na zadnjih treh različicah razširjenih brskalnikov. | TGD §3.3.1; NL PvE NF-3 | P | UAP | D |
| SI-GATE-NFR-023 | Vmesnik mora uporabniku jasno sporočiti uspeh ali napako vsakega dejanja; sporočila »ni odgovora«, »podatki niso na voljo« in napake (čl. 3(3)) morajo biti prikazana razumljivo. | NL PvE NF-4; čl. 3(3) | M | UAP, UP | D |

## 8.4 Zanesljivost

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-030 | Rešitev mora imeti aktivno spremljanje (grozečih) motenj, napak in zmogljivosti z alarmiranjem upravljavca. | NL PvE NF-12, NF-13 | M | OP | D |
| SI-GATE-NFR-031 | Izvajalec mora imeti postopek varnostnega kopiranja in obnove, ki ga preizkusi vsaj enkrat letno in o tem poroča. | NL PvE NF-15 | M | OP | P, D |
| SI-GATE-NFR-032 | Vsaka namestitev nove različice mora imeti preizkušen postopek povrnitve (roll-back). | NL PvE NF-16 | M | OP | D |
| SI-GATE-NFR-033 | Izguba povezave z enim eFTI Gate ali eFTI Platform ne sme vplivati na obdelavo zahtev do drugih eFTI Gate in eFTI Platform (izolacija napak, časovne omejitve, omejevanje ponovnih poskusov). | CTG Security (risk #5, #6); [predlog] | M | EG | T |
| SI-GATE-NFR-034 | Asinhrone zahteve se ob okvari ali ponovnem zagonu posameznega vozlišča ne smejo izgubiti (trajna vrsta sporočil). | RI (RabbitMQ); [predlog] | M | EG | T |

## 8.5 Varnost

### 8.5.1 Skladnost in upravljanje varnosti

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-050 | Rešitev in njeno obratovanje morajo izpolnjevati obveznosti po ZInfV-1 in njegovih podzakonskih aktih, ki veljajo za MZIE oziroma upravljavca eFTI Gate (razvrstitev subjekta preveri MZIE; [preveriti] veljavne uredbe o varnostnih ukrepih). | ZInfV-1 (UL RS 40/25); NIS2 | M | OP | P |
| SI-GATE-NFR-051 | Izvajalec mora imeti vzpostavljen sistem upravljanja informacijske varnosti po ISO/IEC 27001 (certifikat ali enakovredno dokazilo) za ves čas pogodbe. | NL PvE NF-20 | M | OP | P |
| SI-GATE-NFR-052 | Izvajalec mora pred prevzemom izdelati oceno tveganj po metodologiji ENISA in modeliranju groženj STRIDE za eFTI Gate, Registry of Identifiers, Authorisation Registry, AAP in eDelivery Access Point; vsako visoko ali kritično tveganje mora imeti ukrep in testni primer. | CTG Security (Risk Analysis) | M | OP | P |
| SI-GATE-NFR-053 | Vsi podatki, dnevniki in varnostne kopije se morajo hraniti in obdelovati izključno v EGP; dostop iz tretjih držav ni dovoljen. | NL PvE NF-24, NF-39 | M | OP | P |
| SI-GATE-NFR-054 | Osebni podatki (npr. identifikacijske reference uradnikov v dnevnikih) se morajo obdelovati po GDPR in ZVOP-2; izvajalec sklene pogodbo o obdelavi osebnih podatkov z MZIE; uporabi se načelo najmanjšega obsega podatkov. | čl. 2(5); TGD §9.2; CTG Security (GDPR) | M | OP | P |
| SI-GATE-NFR-055 | Razvoj mora slediti načelom varnosti že v zasnovi (secure by design) in OWASP ASVS, raven 2 [predlog]. | NL PvE NF-27; [predlog] | M | EG | P, T |
| SI-GATE-NFR-056 | MZIE ima pravico do revizije varnosti, kakovosti in finančnih vidikov storitve. | NL PvE NF-43 | M | OP | P |

### 8.5.2 Kriptografija, ključi in certifikati

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-060 | Vsa komunikacija med komponentami mora biti šifrirana; zunanji vmesniki morajo uporabljati TLS 1.2 ali novejši (priporočeno TLS 1.3) z medsebojno avtentikacijo, kjer gre za strojno komunikacijo. | TGD §8.1; CTG Security (Testfest: TLS1.2+) | M | EG, ED, AAP | T |
| SI-GATE-NFR-061 | Varnostne ključe eDelivery Access Point mora izvajalec zamenjati vsaj enkrat letno. | TGD §8.1 | M | ED, OP | P |
| SI-GATE-NFR-062 | eFTI Gate mora pred vsako uporabo certifikata preveriti njegovo veljavnost in status preklica (OCSP ali CRL); ob poteku ali preklicu mora avtentikacija spodleteti in vsebina se šteje za nezaupanja vredno. | TGD §8.1; CTG Security (risk #1, #7) | M | EG, ED | T |
| SI-GATE-NFR-063 | Zasebni ključi eFTI Gate morajo biti hranjeni v strojnem varnostnem modulu (HSM) ali enakovredni zaščiteni napravi; v oblaku vsaj s storitvijo za upravljanje ključev z omejenim dostopom. | čl. 10(2); TGD §8.1 | M | ED, OP | P, A |
| SI-GATE-NFR-064 | Certifikate drugih eFTI Gate mora eFTI Gate hraniti v statični shrambi zaupanja; izmenjava certifikatov mora potekati po varnem kanalu, dogovorjenem v mreži za operativno podporo. | TGD §8.2; AG Gate integration (»secure channel«) | M | ED, OP | P |
| SI-GATE-NFR-065 | Izvajalec mora imeti postopek za ravnanje ob kompromitaciji ključa ali certifikata (preklic, zamenjava, obvestitev drugih eFTI Gate in eFTI Platform). | TGD §8.1; CTG Security (backlog #8) | M | OP | P, D |

### 8.5.3 Dostop, identiteta in zaščita pred zlorabo

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-070 | Dostop upravljavcev in skrbnikov mora biti mogoč le z večfaktorsko avtentikacijo in po načelu najmanjših pravic; dodeljene pravice se pregledajo vsaj vsakih 6 mesecev. | NL PvE NF-33, NF-34 | M | UP, OP | P, T |
| SI-GATE-NFR-071 | Seja uporabnika se mora samodejno končati po največ 15 minutah nedejavnosti [predlog; prilagodi se terenski uporabi UAP]. | NL PvE NF-35 | M | UP, UAP | T |
| SI-GATE-NFR-072 | eFTI Gate mora omejevati število zahtev po AAP, eFTI Platform in eFTI Gate (kvote, omejevanje hitrosti) in zaznavati neobičajne vzorce zahtev, da prepreči preobremenitev z zlorabljenim legitimnim računom. | CTG Security (»Account-hijack DoS«, backlog #4, #6) | M | EG | T |
| SI-GATE-NFR-073 | eFTI Gate mora biti zaščiten pred napadi DoS na omrežni ravni (zaščita pred porazdeljenimi napadi, ločena omrežna cona). | CTG Security (backlog #4) | M | OP | P |
| SI-GATE-NFR-074 | Razvojno, testno, predprodukcijsko in produkcijsko okolje morajo biti ločeni; produkcijski podatki se v neprodukcijskih okoljih ne smejo uporabljati. | NL PvE NF-31 | M | OP | P |

### 8.5.4 Dnevniki in revizijska sled

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-080 | eFTI Gate mora beležiti obvezne podatke iz TGD §9.2, tab. 6, in strukturo dnevnika iz TGD Annex 1; poleg zahtev prek UIL mora beležiti tudi iskanja po identifikatorjih in odgovore nanje. | čl. 6(2)(c), 6(2)(g); TGD §9.2 | M | EG | T |
| SI-GATE-NFR-081 | Vsak zapis mora imeti časovni žig z natančnostjo vsaj milisekunde in časovnim pasom; eFTI Gate mora hraniti tudi izvorni časovni žig pošiljatelja. | TGD §9.3 (1) | M | EG | T |
| SI-GATE-NFR-082 | Revizijske sledi morajo biti zaščitene pred spremembo in izbrisom (npr. shranjevanje WORM, veriženje zgoščenih vrednosti, digitalni podpis ali zaupanja vreden časovni žig po RFC 3161); vsaka sprememba mora biti zaznavna. | TGD §9.3 (3), (7) | M | EG, OP | T, P |
| SI-GATE-NFR-083 | Dostop do dnevnikov morajo imeti le identificirani, avtenticirani in pooblaščeni uporabniki z vlogami; vsak dostop se beleži. | TGD §9.4; NL PvE NF-39 | M | UP, OP | T |
| SI-GATE-NFR-084 | Izvajalec mora na zahtevo pristojnega organa iz dnevnikov pripraviti človeku berljiv izpis za posamezno pošiljko ali skupino (iskanje po UIL, času ipd.) po kanalu zunaj verige eFTI Gate–AAP–UAP. | TGD §9.4 | M | UP, OP | D |
| SI-GATE-NFR-085 | Varnostni dogodki in dogodki aktivnosti uporabnikov (tudi skrbnikov) se morajo posredovati v sistem za zaznavanje varnostnih dogodkov (SIEM/SOC) z aktivnim spremljanjem. | NL PvE NF-38, NF-40 | M | OP | D |

### 8.5.5 Varnostno testiranje in incidenti

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-090 | Pred prevzemom in nato vsaj enkrat letno mora neodvisni izvajalec opraviti penetracijski test; ugotovitve kritične in visoke stopnje morajo biti odpravljene pred prevzemom. | NL PvE NF-36; CTG Security (Testfest Security) | M | OP | P |
| SI-GATE-NFR-091 | Izvajalec mora imeti postopek upravljanja ranljivosti s spremljanjem odvisnosti (tudi referenčne implementacije, Domibus) in rokom za varnostne popravke kritičnih ranljivosti **7 dni** [predlog]. | NL PvE NF-37, NF-50–51; [predlog] | M | OP | P |
| SI-GATE-NFR-092 | Izvajalec mora varnostni incident, ki vpliva na razpoložljivost, zaupnost ali celovitost, sporočiti MZIE nemudoma, najpozneje v 24 urah, ter podpreti MZIE pri prijavi po ZInfV-1. | NL PvE NF-41; ZInfV-1 | M | OP | P |
| SI-GATE-NFR-093 | Izvajalec mora imeti načrt odzivanja na incidente z razvrstitvijo in analizo vzrokov, usklajen z incidentnim procesom mreže služb za pomoč (TG1.3). | NL PvE NF-42; TG1.3 (Praga) | M | OP | P |

## 8.6 Vzdrževanje

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-100 | Izvajalec mora uporabljati neprekinjeno integracijo in dostavo (CI/CD) z avtomatiziranimi testi enot, integracije in skladnosti z XSD. | NL PvE NF-46, NF-47 | M | OP | P, D |
| SI-GATE-NFR-101 | Predprodukcijsko okolje mora biti po funkcionalnosti in zmogljivosti reprezentativno za produkcijo in povezljivo z integracijskim omrežjem eFTI4LIVE ter Launchpadom. | NL PvE NF-48; TG2.2 (Praga) | M | OP | D |
| SI-GATE-NFR-102 | Izvajalec mora zagotoviti testne nadomestke (stubs) za eFTI Platform, tuje eFTI Gate in AAP (npr. simulator iz referenčne implementacije). | NL PvE NF-49; RI (platform-gate-simulator) | M | OP | D |
| SI-GATE-NFR-103 | Izvajalec mora spremljati izdaje referenčne implementacije in sheme XSD (TG2.2, CTG Data Model & Interfaces) in o vplivu nove izdaje poročati MZIE v 10 delovnih dneh [predlog]. | ADR-0002; TG2.2 načrt izdaj | M | OP | P |
| SI-GATE-NFR-104 | Upravljanje sprememb mora slediti priznanemu okviru (npr. ITIL) z evidenco, oceno tveganja in postopkom odobritve; kompleksne spremembe imajo analizo vpliva s stroški in roki. | NL PvE NF-57–59; TG1.3 (ITIL) | M | OP | P |
| SI-GATE-NFR-105 | Ob vsaki izdaji mora izvajalec predati posodobljeno dokumentacijo, opombe ob izdaji in poročila o testiranju. | NL PvE NF-45, NF-62 | M | OP | P |

## 8.7 Podpora

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-120 | Služba za pomoč izvajalca mora biti enotna kontaktna točka za prijave motenj in zahtevkov za eFTI Gate. | NL PvE NF-67 | M | OP | P |
| SI-GATE-NFR-121 | Razpoložljivost službe za pomoč mora vsaj ustrezati čl. 12(4) (delavniki 10.00–16.00 CET/CEST; dežurstvo ob koncih tedna in praznikih za nujne zadeve). | čl. 12(4); TGD §10.2 | M | OP | P |
| SI-GATE-NFR-122 | Za vsaj 90 % prijav na prvi ravni mora biti začetni odziv v 15 minutah in prvi stik v 30 minutah znotraj časa razpoložljivosti. (osnutek, TG1.3 skupne operativne zahteve) | TG1.3 (Praga) | M | OP | P |
| SI-GATE-NFR-123 | Odzivni in rešitveni časi morajo biti določeni po prioritetah v pogodbi o ravni storitev (SLA); prioriteta je obvezen podatek prijave (tri razredi po obsegu vpliva). | NL PvE NF-69; TG1.3 C4 | M | OP | P |
| SI-GATE-NFR-124 | Orodje za prijave mora podpirati izmenjavo prijav z drugimi službami (lastna oznaka, oznaka vira, oznaka glavne prijave, obvezna polja po TG1.3). | čl. 12(5); TG1.3 C5, C8 | M | OP | D |

## 8.8 Zmogljivost in razširljivost

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-130 | eFTI Gate mora ob 60-sekundni zakonski meji dodati k času odgovora eFTI Platform ali drugega eFTI Gate največ **1 s** pri 95 % zahtev [predlog] (lastni čas obdelave, brez omrežne zakasnitve do partnerjev). | čl. 3(3)(d), 6(2)(f); ICD v0.5 §10; [predlog] | M | EG | T |
| SI-GATE-NFR-131 | Lokalno iskanje v Registry of Identifiers mora vrniti rezultat v največ **1 s** pri 95 % iskanj [predlog]. | [predlog] | M | RoI | T |
| SI-GATE-NFR-132 | Rešitev mora biti horizontalno razširljiva brez prekinitve storitve in dimenzionirana na obremenitev iz modela obremenitev v M2, z rezervo vsaj **2-kratne** pričakovane konice [predlog]; zmogljivost se dokaže z obremenilnim testom. | CTG Security (risk #6, Performance track); [predlog] | M | EG, OP | T |
| SI-GATE-NFR-133 | eFTI Gate mora prenesti konice zahtev ob terenskih nadzorih (sočasna iskanja po identifikatorjih, ki se posredujejo vsem eFTI Gate) brez preseganja SI-GATE-NFR-130; obremenitveni profil se uskladi s testnimi scenariji Testfest (Performance). | CTG Security (Testfest Performance) | M | EG | T |

## 8.9 Poročanje

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-140 | Izvajalec mora v 5 delovnih dneh po koncu meseca predložiti poročilo o storitvah: razpoložljivost, prijave s prioritetami in časi reševanja, doseganje SLA, odprte prijave z ukrepi, spremembe in izdaje, varnostni dogodki. | NL PvE NF-75–78 | M | OP | P |
| SI-GATE-NFR-141 | Izvajalec mora MZIE zagotoviti podatke o delovanju za nacionalno kontaktno točko eFTI in poročanje v mreži za operativno podporo (npr. število zahtev po vmesnikih, napake, nedosegljivost). | čl. 12(6), 13(3)(a) | M | OP | P |
| SI-GATE-NFR-142 | eFTI Gate mora za vsako koledarsko leto zagotoviti statistiko števila zahtev pristojnih organov za dostop do podatkov eFTI (po organih, vrstah zahtev, vmesnikih in eFTI data subset, kjer so znani) kot dopolnilni vir za poročanje DČ Komisiji; prvo poročilo do 21. 8. 2027. | čl. 17 Uredbe (EU) 2020/1056 | M | EG, UP | D |

## 8.10 Prenosljivost, lastništvo in predaja

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-150 | MZIE postane lastnik izvorne kode, konfiguracije in dokumentacije rešitve ob predaji; uporabljene odprtokodne komponente (tudi referenčna implementacija, Apache-2.0) morajo imeti licenco, združljivo s tem. | NL PvE NF-84; ADR-0002 | M | OP | P |
| SI-GATE-NFR-151 | Ob prenehanju pogodbe mora izvajalec brezplačno predati vso izvorno kodo in podatke v izvirnih, trajnih formatih ter po potrditvi predaje uničiti podatke v svojih sistemih in to pisno potrditi. | NL PvE NF-83 | M | OP | P |
| SI-GATE-NFR-152 | Rešitev mora biti nameščljiva v standardnih vsebnikih (npr. OCI) in prenosljiva med okolji gostovanja brez spremembe kode (model gostovanja izbere M2). | NL PvE NF-81; RI (Docker) | M | EG, OP | D |
| SI-GATE-NFR-153 | Rešitev mora biti predana v produkcijo in v upravljanje MZIE najpozneje do 9. 7. 2027 (časovni načrt v pogl. 10). | NL PvE NF-85; čl. 5(1) Uredbe (EU) 2020/1056 (datum izpeljan v 10.1) | M | OP | P |

## 8.11 Vrednosti za odločitev MZIE

| Zahteva | Predlagana vrednost | Utemeljitev |
|---|---|---|
| NFR-002 razpoložljivost | 99,5 % mesečno; napovedana vzdrževalna okna do 4 h mesečno izvzeta | EU vrednosti ni; TG1.3 ocenjuje 99,9 % kot nerealno; ena izpadla ura na dan bi onemogočila nadzore |
| NFR-005 RTO / RPO | 4 h / 15 min | Registry of Identifiers mora biti ob obnovi ažuren (aktivni prevozi) |
| NFR-012 sočasne različice XSD | 2 | ICD §13 predvideva prehodna obdobja; število ni določeno |
| NFR-013 rok za uvedbo sprememb EU | 3 mesece | XSD 1.0 → 1.1 po načrtu v ~6 mesecih (Praga) |
| NFR-071 časovna omejitev seje | 15 min | NL PvE; za terensko UAP morda daljša |
| NFR-091 varnostni popravki | 7 dni za kritične | običajna praksa |
| NFR-130, 131 lastni čas obdelave | ≤ 1 s (p95) | 60 s je meja za celotno verigo |
| NFR-132 rezerva zmogljivosti | 2× konica iz M2 | CTG Security opozarja na stroške horizontalnega skaliranja |

**Preveriti pred oddajo:** veljavne podzakonske akte ZInfV-1 za organe državne uprave; veljavni predpis o dostopnosti spletišč.
