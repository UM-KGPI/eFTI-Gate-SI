# Priloga C: Matrika sledljivosti zahtev (oznaka zahteve, vir, preverjanje)

> **Generirano** s `scripts/build-traceability.py` iz tabel zahtev v poglavjih; ne urejaj ročno.
>
> Število zahtev: 227. Pomen stolpcev P, Komp. in Preverjanje: pogl. 6.0. Element C4 je identifikator v `architecture/workspace.dsl` (Priloga D). Izdaja po pogl. 10.5.

| Oznaka | Kratek opis | Vir | P | Izdaja | Komp. | Element C4 | Preverjanje | Pogl. |
|---|---|---|---|---|---|---|---|---|
| SI-GATE-FR-001 | Sistem mora uradniku pristojnega organa omogočiti dostop do podatkov eFTI z neposredno obdelavo UIL, ki jo … | čl. 2(1)(a) | M | R1 | PE, UA | `organi`, `vrata.gateService` | T | 6 |
| SI-GATE-FR-002 | Sistem mora omogočiti pridobitev UIL iz registra identifikatorjev na podlagi identifikatorja, povezanega s … | čl. 2(1)(b) | M | R1 | IM, RID, UA | `organi`, `vrata.gateService.iskalnik`, `vrata.gateService.roi` | T | 6 |
| SI-GATE-FR-003 | Sistem mora ob vsaki zahtevi za dostop do podatkov eFTI zagotoviti avtentificirano identifikacijo in … | čl. 2(2)(a) | P | R1 | AAP, RD | `organi` | T | 6 |
| SI-GATE-FR-004 | Sistem mora posredovati zahteve uradnikov, vključno s pridobivanjem zahtevanih informacij od ustrezne … | čl. 2(2)(b) | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 6 |
| SI-GATE-FR-005 | Rešitev mora vsebovati vsaj komponente: dostopovne točke organov, register dovoljenj, prehod eFTI, iskalni … | čl. 2(3) | M | R1 | vse | `vrata`, `organi` | P | 6 |
| SI-GATE-FR-006 | Izvajalec mora zagotoviti vzpostavitev, gostovanje, razvoj, razpoložljivost, spremljanje, posodabljanje in … | čl. 2(4) | M | R1 | OP | — | P | 6 |
| SI-GATE-FR-007 | Sistem mora dostop do podatkov eFTI in njihovo obdelavo omejiti na namene preverjanja skladnosti in ga … | čl. 2(5) | M | R1 | AAP, RD, PE | `organi`, `vrata.gateService` | T, P | 6 |
| SI-GATE-FR-010 | Uradnik mora vse zahteve za dostop vložiti v uporabniški aplikaciji preko dostopovne točke organa; prehod … | čl. 3(1), čl. 4(1) | M | R1 | AAP, UA, PE | `organi`, `vrata.gateService` | T | 6 |
| SI-GATE-FR-011 | Zahteva za dostop mora vsebovati UIL ali enega ali več identifikatorjev za pridobitev UIL iz registra … | čl. 3(2)(a) | M | R1 | UA, PE | `organi`, `vrata.gateService` | T | 6 |
| SI-GATE-FR-012 | Uporabniška aplikacija mora zahtevi samodejno dodati sklice na pravice dostopa uradnika iz registra dovoljenj. | čl. 3(2)(b) | P | R1 | UA, RD | `organi` | T | 6 |
| SI-GATE-FR-013 | Zahteva mora vsebovati edinstveno identifikacijsko številko, ki jo izda AAP; uporabniška aplikacija jo doda … | čl. 3(2)(c) | P | R1 | AAP, UA | `organi` | T | 6 |
| SI-GATE-FR-014 | Sistem mora podpirati odgovor s podatki eFTI in metapodatki oziroma identifikatorji sporočil, ki prehodom in … | čl. 3(3)(a) | M | R1 | PE, AAP | `organi`, `vrata.gateService` | T | 6 |
| SI-GATE-FR-015 | Sistem mora podpirati sporočila o napaki s kodirano ali kratko besedilno specifikacijo vrste napake, kadar … | čl. 3(3)(b) | M | R1 | PE | `vrata.gateService` | T | 6 |
| SI-GATE-FR-016 | Prehod eFTI, ki prejme zahtevo z identifikatorji, mora izdati sporočilo, da podatki niso na voljo, kadar … | čl. 3(3)(c) | M | R1 | PE, IM | `vrata.gateService`, `vrata.gateService.iskalnik` | T | 6 |
| SI-GATE-FR-017 | Sistem mora podpirati sporočilo »ni odgovora«, kadar prehod ali platforma potrdi prejem zahteve, a v 60 … | čl. 3(3)(d) | M | R1 | PE | `vrata.gateService` | T | 6 |
| SI-GATE-FR-018 | Uporabniška aplikacija mora uradniku omogočiti vložitev sporočila o nadaljnjem ukrepanju, kadar ugotovi, da … | čl. 3(4) | P | R1 | UA | `organi` | D | 6 |
| SI-GATE-FR-019 | Sporočilo o nadaljnjem ukrepanju se mora posredovati preko AAP in vsebovati informacije za gospodarski … | čl. 3(5) | M | R1 | AAP, UA, PE | `organi`, `vrata.gateService` | T | 6 |
| SI-GATE-FR-030 | AAP mora biti edina točka dostopa uradnika do okolja za izmenjavo eFTI. | čl. 4(1) | P | R1 | AAP | `organi` | A, T | 6 |
| SI-GATE-FR-031 | AAP mora avtentificirati identiteto uradnika ali zagotoviti, da jo avtentificira druga ustrezna komponenta. | čl. 4(2)(a), 4(3)(a) | P | R1 | AAP | `organi` | T | 6 |
| SI-GATE-FR-032 | AAP mora zahtevo odobriti na podlagi pravic dostopa iz registra dovoljenj ali jo zavrniti, če uradnik nima … | čl. 4(2)(b) | P | R1 | AAP, RD | `organi` | T | 6 |
| SI-GATE-FR-033 | AAP mora vsako odobreno zahtevo registrirati z edinstveno identifikacijsko številko in evidentirati vsaj: … | čl. 4(2)(c) | P | R1 | AAP | `organi` | T | 6 |
| SI-GATE-FR-034 | AAP mora odobreno zahtevo poslati prehodu eFTI z edinstveno številko zahteve, UIL ali identifikatorji in … | čl. 4(2)(d) | P | R1 | AAP | `organi` | T | 6 |
| SI-GATE-FR-035 | AAP mora odgovore prehoda prejeti in jih preko uporabniške aplikacije dati na voljo odgovornemu uradniku. | čl. 4(2)(e) | P | R1 | AAP, UA | `organi` | T | 6 |
| SI-GATE-FR-036 | AAP mora za vsak odgovor voditi revizijsko sled: številka zahteve, datum in čas prejema odgovora, datum in … | čl. 4(2)(f) | P | R1 | AAP | `organi` | T | 6 |
| SI-GATE-FR-037 | AAP mora arhiv zahtev in dnevnik odgovorov hraniti dve leti ali dlje, če to določajo nacionalni predpisi o … | čl. 4(2)(g) | P | R1 | AAP | `organi` | P, T | 6 |
| SI-GATE-FR-038 | AAP mora vsako sporočilo o nadaljnjem ukrepanju registrirati z edinstveno številko in evidentirati: … | čl. 4(2)(h) | P | R1 | AAP | `organi` | T | 6 |
| SI-GATE-FR-039 | AAP mora sporočilo o nadaljnjem ukrepanju poslati prehodu eFTI z UIL, številko izvorne zahteve in vsebino … | čl. 4(2)(i) | P | R1 | AAP | `organi` | T | 6 |
| SI-GATE-FR-040 | AAP mora uporabljati sredstva elektronske identifikacije, ki omogočajo zanesljivo identifikacijo in … | čl. 4(3)(a) | P | R1 | AAP | `organi` | P, T | 6 |
| SI-GATE-FR-041 | AAP mora vzpostaviti in ohranjati varno povezavo s prehodom eFTI ter podpirati varno povezavo z uporabniško … | čl. 4(3)(c), 4(3)(d) | M | R1 | AAP, PE | `organi`, `vrata.gateService` | T | 6 |
| SI-GATE-FR-060 | Register dovoljenj mora za vsakega uradnika hraniti edinstveno identifikacijsko referenco. | čl. 5(a) | P | R1 | RD | `organi` | T | 6 |
| SI-GATE-FR-061 | Register dovoljenj mora hraniti pravice dostopa kot seznam sklicev na pravne akte EU in nacionalne pravne … | čl. 5(b) | P | R1 | RD | `organi` | T, P | 6 |
| SI-GATE-FR-062 | Register dovoljenj mora hraniti pravice obdelave kot kodirane sklice na postopke obdelave za vsak podsklop … | čl. 5(c) | P | R1 | RD | `organi` | T | 6 |
| SI-GATE-FR-063 | Register dovoljenj mora voditi dnevnik sprememb pravic dostopa in pravic obdelave. | čl. 5(d) | P | R1 | RD | `organi` | T | 6 |
| SI-GATE-FR-070 | Prehod eFTI mora neposredno ali preko drugih prehodov zagotoviti, da se odobrene zahteve z zahtevanimi … | čl. 6(1)(a) | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 6 |
| SI-GATE-FR-071 | Prehod eFTI mora odgovor platforme posredovati uporabniški aplikaciji odgovornega uradnika, neposredno ali … | čl. 6(1)(b) | M | R1 | PE | `vrata.gateService` | T | 6 |
| SI-GATE-FR-072 | Prehod eFTI mora sporočilo o nadaljnjem ukrepanju posredovati platformi eFTI, ki hrani podatke izvorne … | čl. 6(1)(c) | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 6 |
| SI-GATE-FR-073 | Kot »prehod, ki zahteva dostop«, pri AAP kot ločeni komponenti, mora prehod potrditi zahtevo ali sporočilo o … | čl. 6(2)(a)(i) | P | R1 | PE | `vrata.gateService` | T | 6 |
| SI-GATE-FR-074 | Kot »prehod, ki prejme zahtevo« mora prehod potrditi zahtevo ali sporočilo o nadaljnjem ukrepanju s … | čl. 6(2)(a)(ii) | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 6 |
| SI-GATE-FR-075 | Če preverjanje ključa ni uspešno, mora prehod poslati sporočilo o napaki prehodu, ki zahteva dostop, AAP ali … | čl. 6(2)(a)(iii) | M | R1 | PE | `vrata.gateService` | T | 6 |
| SI-GATE-FR-076 | Prehod mora zahtevo ali sporočilo o nadaljnjem ukrepanju obdelati z iskalnim mehanizmom in ga posredovati: … | čl. 6(2)(b) | M | R1 | PE, IM | `vrata.gateService`, `vrata.gateService.iskalnik` | T | 6 |
| SI-GATE-FR-077 | Prehod mora za vsako obdelano zahtevo ali sporočilo o nadaljnjem ukrepanju voditi revizijsko sled vsaj z: … | čl. 6(2)(c) | M | R1 | PE | `vrata.gateService` | T | 6 |
| SI-GATE-FR-078 | Ob odgovoru neposredno od platforme mora prehod preveriti varnostni ključ **in certifikacijski status** … | čl. 6(2)(d)(i) | M | R1 | PE | `vrata.gateService` | T | 6 |
| SI-GATE-FR-079 | Ob odgovoru od prehoda, ki prejme zahtevo, mora prehod preveriti njegov varnostni ključ na podlagi registra … | čl. 6(2)(d)(ii) | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 6 |
| SI-GATE-FR-080 | Če preverjanje ključa ali certifikacijskega statusa ni uspešno, mora prehod poslati ustrezno sporočilo o … | čl. 6(2)(d)(iii) | M | R1 | PE | `vrata.gateService` | T | 6 |
| SI-GATE-FR-081 | Prehod mora odgovor posredovati po isti poti v obratnem zaporedju: prehodu, ki zahteva dostop, ali … | čl. 6(2)(e) | M | R1 | PE | `vrata.gateService` | T | 6 |
| SI-GATE-FR-085 | Če je prejeta potrditev prejema zahteve (od platforme ali prehoda, ki prejme zahtevo), drug odgovor pa ne v … | čl. 6(2)(f) | M | R1 | PE | `vrata.gateService` | T | 6 |
| SI-GATE-FR-086 | Prehod mora za vsak posredovani odgovor voditi revizijsko sled vsaj z: UIL prejetega sklopa podatkov, … | čl. 6(2)(g) | M | R1 | PE | `vrata.gateService` | T | 6 |
| SI-GATE-FR-087 | Prehod mora evidence iz SI-GATE-FR-077 in SI-GATE-FR-086 arhivirati in hraniti za revizijo dve leti ali … | čl. 6(2)(h) | M | R1 | PE, OP | `vrata.gateService` | P, T | 6 |
| SI-GATE-FR-090 | Prehod mora vzpostaviti in ohranjati varno povezavo z AAP slovenskih pristojnih organov. | čl. 6(3)(b) | M | R1 | PE | `vrata.gateService` | T | 6 |
| SI-GATE-FR-091 | Kadar so AAP integrirane v prehod, mora prehod vzpostaviti in ohranjati varno povezavo z uporabniškimi … | čl. 6(3)(c), 6(3)(d) | M | R1 | PE, UP | `vrata.admin`, `vrata.gateService` | T, D | 6 |
| SI-GATE-FR-092 | Prehod mora vzpostaviti in ohranjati varno povezavo z vsemi drugimi prehodi eFTI in posodobljen register z … | čl. 6(3)(e) | M | R1 | PE, ED, UP | `vrata.admin`, `vrata.ap`, `vrata.gateService` | T, D | 6 |
| SI-GATE-FR-093 | Prehod mora vzpostaviti in ohranjati varno povezavo z vsemi platformami eFTI, certificiranimi v Sloveniji, … | čl. 6(3)(f) | M | R1 | PE, ED, UP | `vrata.admin`, `vrata.ap`, `vrata.gateService` | T, D | 6 |
| SI-GATE-FR-094 | Prehod mora omogočati uporabo splošno opredeljenih storitev in ključnih elementov (konfiguracija, kode … | čl. 6(3)(g) | M | R1 | PE | `vrata.gateService` | P, D | 6 |
| SI-GATE-FR-095 | Dokler v Sloveniji noben organ za ugotavljanje skladnosti ni akreditiran za certifikacijo platform, mora … | čl. 6(4) | M | R1 | PE, UP, OP | `vrata.admin`, `vrata.gateService` | D, P | 6 |
| SI-GATE-FR-110 | Uporabniška aplikacija mora ustvariti zahtevo na podlagi informacij uradnika, potem ko AAP uradnika … | čl. 7(2)(a) | P | R1 | UA | `organi` | T | 6 |
| SI-GATE-FR-111 | Uporabniška aplikacija mora prejeti podatke eFTI, sporočilo »ni odgovora« ali sporočilo o napaki in jih … | čl. 7(2)(b) | P | R1 | UA | `organi` | T, D | 6 |
| SI-GATE-FR-112 | Uporabniška aplikacija mora omogočiti druge postopke obdelave prejetih podatkov v skladu s pravicami … | čl. 7(2)(c) | P | R1 | UA | `organi` | T | 6 |
| SI-GATE-FR-113 | Kadar nacionalni predpisi to omogočajo, mora uporabniška aplikacija ustvariti sporočila o nadaljnjem … | čl. 7(2)(d) | P | R1 | UA | `organi` | D | 6 |
| SI-GATE-FR-114 | Uporabniška aplikacija mora zagotavljati grafični uporabniški vmesnik, varno povezavo z AAP ali prehodom in … | čl. 7(3) | P | R1 | UA | `organi` | D, T | 6 |
| SI-GATE-FR-120 | Iskalni mehanizem mora biti vgrajen v prehod eFTI. | čl. 8(1) | M | R1 | IM | `vrata.gateService.iskalnik` | P | 6 |
| SI-GATE-FR-121 | Iskalni mehanizem mora iz UIL pridobiti identifikator platforme, ki hrani podatke, oziroma identifikator … | čl. 8(1)(a) | M | R1 | IM | `vrata.gateService.iskalnik` | T | 6 |
| SI-GATE-FR-122 | Če zahteva vsebuje identifikatorje iz čl. 11(3), mora iskalni mehanizem iskati v registru identifikatorjev; … | čl. 8(1)(b) | M | R1 | IM, RID | `vrata.gateService.iskalnik`, `vrata.gateService.roi` | T | 6 |
| SI-GATE-FR-123 | Iskalni mehanizem mora upravljati register identifikatorjev v skladu s čl. 11. | čl. 8(2)(a) | M | R1 | IM, RID | `vrata.gateService.iskalnik`, `vrata.gateService.roi` | T | 6 |
| SI-GATE-FR-124 | Iskalni mehanizem mora za odkrivanje platform uporabljati SMP in SML v skladu s specifikacijami eDelivery … | čl. 8(2)(b) | M | R1 | IM, ED | `vrata.ap`, `vrata.gateService.iskalnik` | T | 6 |
| SI-GATE-FR-130 | Prehod, AAP in uporabniška aplikacija morajo komunicirati v standardizirani obliki za izmenjavo sporočil. | čl. 9(1) | M | R1 | PE, AAP, UA | `organi`, `vrata.gateService` | P, T | 6 |
| SI-GATE-FR-131 | Komunikacija med prehodi ter med prehodom in platformami mora potekati v obliki XML (veljavna verzija sheme … | čl. 9(1) | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 6 |
| SI-GATE-FR-132 | Vsa komunikacija med prehodi mora potekati preko dostopovnih točk za eDelivery po specifikacijah za … | čl. 9(2) | M | R1 | ED | `vrata.ap` | T | 6 |
| SI-GATE-FR-133 | Za komunikacijo med prehodom in platformami mora biti omogočena izmenjava preko dostopovnih točk za … | čl. 9(3) | M | R1 | ED | `vrata.ap` | T | 6 |
| SI-GATE-FR-134 | Če MZIE odloči, da poleg eDelivery dovoli tudi enakovredne nacionalno opredeljene specifikacije za … | čl. 9(4) | P | R1 | PE, OP | `vrata.gateService` | P | 6 |
| SI-GATE-FR-140 | Dostopni točki eDelivery prehoda in dostopnim točkam platform, certificiranih v Sloveniji, se morajo izdati … | čl. 10(1) | M | R1 | ED, OP | `vrata.ap` | P | 6 |
| SI-GATE-FR-141 | Zasebni ključi dostopne točke eDelivery prehoda morajo biti varno shranjeni (npr. HSM ali enakovredna … | čl. 10(2) | M | R1 | ED, OP | `vrata.ap` | P, A | 6 |
| SI-GATE-FR-142 | Rešitev mora zagotavljati varne mehanizme za prejemanje, evidentiranje, pridobivanje in potrjevanje javnih … | čl. 10(3) | M | R1 | UP, ED | `vrata.admin`, `vrata.ap` | D, T | 6 |
| SI-GATE-FR-150 | Register identifikatorjev mora platformam omogočiti nalaganje UIL skupaj z identifikatorji ter nalaganje, … | čl. 11(1) | M | R1 | RID | `vrata.gateService.roi` | T | 6 |
| SI-GATE-FR-151 | Prehod mora iz UIL razbrati identifikator prehoda, identifikator platforme in UUID sklopa podatkov, ki ga … | čl. 11(2) | M | R1 | IM, RID | `vrata.gateService.iskalnik`, `vrata.gateService.roi` | T | 6 |
| SI-GATE-FR-152 | Prehod mora imeti identifikator, ki omogoča enoznačno odkrivanje v okolju eFTI (dogovor o poimenovanju: ICD … | čl. 11(2)(a) | M | R1 | PE, OP | `vrata.gateService` | P | 6 |
| SI-GATE-FR-153 | Register identifikatorjev mora podpirati vsaj identifikatorje eFTI39, eFTI188, eFTI374, eFTI378, eFTI448, … | čl. 11(3) | M | R1 | RID | `vrata.gateService.roi` | T | 6 |
| SI-GATE-FR-154 | Register identifikatorjev mora UIL aktivirati in dati na voljo za poizvedbe takoj po nalaganju ter jo … | čl. 11(4) | M | R1 | RID | `vrata.gateService.roi` | T | 6 |
| SI-GATE-FR-155 | Za UIL, pri katerih ima eFTI581 vrednost »3« (cestni prevoz), mora register UIL deaktivirati šele po izteku … | čl. 11(4) | M | R1 | RID | `vrata.gateService.roi` | T | 6 |
| SI-GATE-FR-156 | Po deaktivaciji mora register UIL in z njo povezane identifikatorje izbrisati. | čl. 11(4) | M | R1 | RID | `vrata.gateService.roi` | T | 6 |
| SI-GATE-FR-170 | Rešitev mora podpirati službo za pomoč uporabnikom na prvi ravni (za uradnike) in na drugi ravni (za službe … | čl. 12(1) | M | R1 | OP | — | P | 6 |
| SI-GATE-FR-171 | Službe za pomoč morajo biti na voljo ob delavnikih vsaj med 10.00 in 16.00 (CET/CEST), razen ob praznikih; … | čl. 12(4) | M | R1 | OP | — | P | 6 |
| SI-GATE-FR-172 | Služba za pomoč mora uporabljati orodje, ki omogoča enotno identifikacijo vsake prošnje in nadaljnje … | čl. 12(5) | M | R1 | OP | — | D | 6 |
| SI-GATE-FR-173 | Služba za pomoč mora voditi dnevnike vseh prošenj in njihove zgodovine ter redno poročati o dejavnostih. | čl. 12(6) | M | R1 | OP | — | P | 6 |
| SI-GATE-FR-174 | Službe za pomoč morajo biti na voljo od datuma iz čl. 5(1) Uredbe (EU) 2020/1056. | čl. 12(8) | M | R1 | OP | — | P | 6 |
| SI-GATE-FR-175 | Izvajalec mora nacionalni kontaktni točki eFTI (čl. 13(2)) zagotavljati podatke o stanju delovanja … | čl. 13(3)(a) | M | R1 | OP | — | P | 6 |
| SI-GATE-FR-200 | Prehod mora podpirati obe vlogi, »prehod, ki zahteva dostop« in »prehod, ki prejme zahtevo«, za vse vrste … | čl. 1(13), 1(14); TGD §3.3 | M | R1 | PE | `vrata.gateService` | T | 7 |
| SI-GATE-FR-201 | Prehod mora iskanje po identifikatorjih posredovati vsem prehodom v registru prehodov; kot nastavljivo … | TGD §6.2 | M | R1 | PE, IM | `vrata.gateService`, `vrata.gateService.iskalnik` | T | 7 |
| SI-GATE-FR-202 | Prehod mora odgovoriti na vsako iskanje, ki ga prejme od drugega prehoda. | TGD §6.2 | M | R1 | PE, IM | `vrata.gateService`, `vrata.gateService.iskalnik` | T | 7 |
| SI-GATE-FR-203 | Pri sinhronem načinu mora prehod delne rezultate združiti v en odgovor s statusom vsakega prehoda (COMPLETE, … | TGD §6.3 | M | R1 | PE | `vrata.gateService` | T | 7 |
| SI-GATE-FR-204 | Prehod mora pri posredovanju prek več prehodov ohraniti korelacijski identifikator zahteve od AAP do … | ICD v0.5 §4.2, §6.3 | M | R1 | PE | `vrata.gateService` | T | 7 |
| SI-GATE-FR-205 | Napake, prejete od drugega prehoda, mora prehod posredovati nespremenjene v običajni vrsti odgovora. (osnutek) | ICD v0.5 §11 | M | R1 | PE | `vrata.gateService` | T | 7 |
| SI-GATE-FR-210 | Prehod mora nabor identifikatorjev sprejeti le, če obstajajo vsi obvezni identifikatorji in so tip ter … | TGD §6.1 | M | R1 | RID | `vrata.gateService.roi` | T | 7 |
| SI-GATE-FR-211 | Pri nalaganju za UIL, ki že obstaja, mora prehod nov nabor identifikatorjev zamenjati s starim (ne … | TGD §6.1 | M | R1 | RID | `vrata.gateService.roi` | T | 7 |
| SI-GATE-FR-212 | Prehod mora zapis deaktivirati in izbrisati tudi ob posodobitvi identifikatorja eFTI596 (dejanski datum … | TGD §6.1 | P | R1 | RID | `vrata.gateService.roi` | T | 7 |
| SI-GATE-FR-213 | Nabor identifikatorjev registra mora biti nastavljiv brez spremembe programske kode, da se lahko uvede … | TGD §6.4, tab. 4 | M | R1 | RID | `vrata.gateService.roi` | D, T | 7 |
| SI-GATE-FR-214 | Prehod mora nalaganje identifikatorjev sprejeti le od platform z veljavnim certifikacijskim statusom v … | čl. 6(3)(f), 11(1) | M | R1 | RID, PE | `vrata.gateService`, `vrata.gateService.roi` | T | 7 |
| SI-GATE-FR-215 | Prehod mora platformi posredovati pravice dostopa uradnika, tako da platforma lahko vrne le podsklope, za … | čl. 4(2)(d)(iii); TGD §3.3.1 | M | R1 | PE | `vrata.gateService` | T | 7 |
| SI-GATE-FR-216 | Časovniki se merijo od trenutka potrditve prejema zahteve: platforma mora odgovoriti v 50 s; prehod, ki … | ICD v0.5 §10 | M | R1 | PE | `vrata.gateService` | T | 7 |
| SI-GATE-FR-217 | Prehod ne sme zavrniti sklopa podatkov zaradi manjkajočih podatkov; o popolnosti odloči uradnik. Prehod … | ICD v0.5 §12 | M | R1 | PE | `vrata.gateService` | T | 7 |
| SI-GATE-FR-218 | Prehod mora od platforme sprejeti potrdilo o prejemu sporočila o nadaljnjem ukrepanju in ga posredovati AAP. | TGD §3.3.4 | M | R1 | PE | `vrata.gateService` | T | 7 |
| SI-GATE-FR-230 | AAP mora za identifikacijo uradnikov uporabljati nacionalne gradnike e-identitete (SI-PASS, SI-CAS, SIGEN-CA … | čl. 4(3)(a); SI implementacijski načrt (20. 5. 2026) | P | R1 | AAP | `organi` | P, T | 7 |
| SI-GATE-FR-231 | Med AAP in prehodom mora potekati medsebojna avtentikacija s certifikati (mTLS ali enakovredno) in … | čl. 6(2)(a)(i), 6(3)(d) | M | R1 | PE, AAP | `organi`, `vrata.gateService` | T | 7 |
| SI-GATE-FR-232 | Avtorizacijski žeton ali sporočilo, ki ga AAP posreduje prehodu, mora vsebovati sklice na pravice obdelave … | čl. 4(2)(d)(iii) | M | R1 | AAP, PE | `organi`, `vrata.gateService` | T | 7 |
| SI-GATE-FR-233 | Register dovoljenj mora biti mogoče vzdrževati prek programskega vmesnika (sinhronizacija s kadrovskimi … | NL PvE §4.4 | P | R2 | RD | `organi` | D | 7 |
| SI-GATE-FR-240 | Pri sestavljenih iskalnih poljih (uporabljeno prevozno sredstvo, uporabljena ali prevažana prevozna oprema) … | TGD §6.4 | M | R1 | IM | `vrata.gateService.iskalnik` | T | 7 |
| SI-GATE-FR-241 | Iskanje mora vrniti seznam celotnih zapisov (UIL in identifikatorji) aktivnih sklopov podatkov; register … | TGD §6 | M | R1 | IM, RID | `vrata.gateService.iskalnik`, `vrata.gateService.roi` | T | 7 |
| SI-GATE-FR-242 | Iskanje mora biti enako pri iskanju slovenskega organa in pri iskanju, prejetem od drugega prehoda (enaka … | TGD §6.4 | M | R1 | IM | `vrata.gateService.iskalnik` | T | 7 |
| SI-GATE-FR-250 | Prehod mora pristojnim organom zagotoviti programski vmesnik (#3) za PU-CA-1 do PU-CA-4 z javno, različicam … | čl. 6(3)(b); ICD v0.5 §3.1 | M | R1 | PE (`vrata.caApi`) | `vrata.gateService` | P, T | 7 |
| SI-GATE-FR-251 | Vmesnik #3 mora podpirati asinhrono obdelavo: AAP ob zahtevi prejme identifikator in pozneje pridobi odgovor … | TGD §6.3; RI (REST API za organe) | M | R1 | PE | `vrata.gateService` | T | 7 |
| SI-GATE-FR-252 | Vmesnik #3 mora za podatke uporabljati standardne tipe sporočil eFTI (XSD), kjer je to mogoče. (osnutek) | ICD v0.5 P-01 | P | R1 | PE | `vrata.gateService` | P | 7 |
| SI-GATE-FR-253 | Vmesnik #3 mora omogočiti zahtevo za določeno različico sklopa podatkov, ki se prenese v kontekstu … | ICD v0.5 §13, P-06 | P | R2 | PE | `vrata.gateService` | T | 7 |
| SI-GATE-FR-270 | Upravljavska aplikacija mora omogočiti vodenje registra platform (edinstvena številka, varnostni ključi, … | čl. 6(3)(d)–(f) | M | R1 | UP | `vrata.admin` | D | 7 |
| SI-GATE-FR-271 | Certifikacijski status platform mora prehod samodejno usklajevati z Unijskim referenčnim seznamom ali … | čl. 6(2)(d)(i), 6(3)(f); AG Union Registry (Praga) | M | R2 | PE (`certCheck`), UP | `vrata.admin`, `vrata.gateService` | T | 7 |
| SI-GATE-FR-272 | Upravljavska aplikacija mora podpirati postopek priklopa platforme, certificirane v drugi DČ … | čl. 6(4) | M | R1 | UP | `vrata.admin` | D | 7 |
| SI-GATE-FR-273 | Upravljavska aplikacija mora upravljavcem omogočiti pregled revizijskih sledi (SI-GATE-FR-077, 086) z … | čl. 6(2)(c), 6(2)(g); TGD §9.4 | M | R1 | UP | `vrata.admin` | D | 7 |
| SI-GATE-FR-274 | Prehod mora za nadzor delovanja oddajati metrike (razpoložljivost, odzivni časi, napake po vrstah, število … | TGD §9.2; TG1.3 (Praga) | M | R1 | PE, OP | `vrata.gateService` | D | 7 |
| SI-GATE-FR-275 | Upravljavska aplikacija mora omogočiti posodobitev skupnih šifrantov, kod napak in konfiguracije, … | čl. 6(3)(g) | M | R1 | UP | `vrata.admin` | D | 7 |
| SI-GATE-FR-290 | Dostopna točka eDelivery mora delovati po profilu AS4 in konfiguraciji PMode iz TGD Annex 1 (tabela 13). | čl. 9(2); TGD Annex 1 | M | R1 | ED | `vrata.ap` | T | 7 |
| SI-GATE-FR-291 | Za #1 (G2G) mora uporabljati statično odkrivanje, za #2 (G2P) dinamično odkrivanje prek SML/SMP. | čl. 9(2), 9(3) | M | R1 | ED | `vrata.ap` | T | 7 |
| SI-GATE-FR-292 | Identifikatorji strank in končnih točk morajo slediti dogovorjenim pravilom poimenovanja (ICD v0.5 P-22; … | ICD v0.5 §6.1 | M | R1 | ED, OP | `vrata.ap` | P | 7 |
| SI-GATE-FR-293 | Povezovalnik mora preslikati korelacijske identifikatorje v glavo AS4 (MessageId, ConversationId, … | ICD v0.5 §8.4 | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 7 |
| SI-GATE-FR-294 | Prehod mora podpirati nadgradnjo dostopne točke eDelivery (npr. na Domibus 2.x) brez spremembe vmesnikov #1 … | Praga, Q&A DG MOVE (vpr. 14) | M | R1 | ED, OP | `vrata.ap` | A | 7 |
| SI-GATE-NFR-001 | Prehod eFTI mora delovati neprekinjeno (24/7/365), ker nadzor prevozov poteka ves čas. | NL PvE NF-1; čl. 3(3)(d) | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | A, T | 8 |
| SI-GATE-NFR-002 | Mesečna razpoložljivost storitev prehoda (vmesniki #1, #2, #3) mora znašati vsaj **99,5 %** [predlog]; … | TG1.3 (Praga); [predlog] | M | R1 | PE, OP | `vrata.gateService` | A | 8 |
| SI-GATE-NFR-003 | Načrtovano vzdrževanje mora biti napovedano vsaj en delovni dan vnaprej uporabnikom in drugim prehodom po … | TG1.3 (Praga) | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-004 | Register platform (preverjanje certifikata in certifikacijskega statusa) mora odgovoriti na poizvedbo … | TGD §8.3 | M | R1 | PE, UP | `vrata.admin`, `vrata.gateService` | T | 8 |
| SI-GATE-NFR-005 | Rešitev mora imeti načrt neprekinjenega poslovanja in obnove po katastrofi s ciljnim časom obnove (RTO) **4 … | NL PvE NF-15; [predlog] | M | R1 | OP | — | P, D | 8 |
| SI-GATE-NFR-010 | Prehod mora pred priklopom v produkcijsko omrežje prehodov uspešno opraviti teste skladnosti proti … | TG2.2 (Praga), ADR-0002 | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 8 |
| SI-GATE-NFR-011 | Prehod mora opraviti tehnične teste skladnosti (TCT) in varnostne teste, ki jih zagotavlja EK oziroma … | TG2.2 Launchpad (Praga); D2.2 | M | R1 | PE | `vrata.gateService` | T | 8 |
| SI-GATE-NFR-012 | Prehod mora hkrati podpirati vsaj dve zaporedni veljavni različici sheme XSD v prehodnem obdobju po izdaji … | ICD v0.5 §13; AG Gate integration (odprto vpr.) | M | R1 | PE | `vrata.gateService` | T | 8 |
| SI-GATE-NFR-013 | Izvajalec mora v 3 mesecih [predlog] po izdaji nove obvezne različice XSD ali sprememb TGD/ICD, ki jih … | čl. 6(3)(g), 13; [predlog] | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-014 | Specifikacija vmesnika #3 (in morebitnega profila REST za #2) mora biti objavljena v strojno berljivi obliki … | čl. 9(4); ICD v0.5 §9 | M | R1 | PE | `vrata.gateService` | P | 8 |
| SI-GATE-NFR-020 | Uporabniški vmesniki, pomoč in uporabniška dokumentacija morajo biti v slovenskem jeziku; tehnična … | NL PvE NF-7; [predlog] | M | R1 | UP, UA | `organi`, `vrata.admin` | P | 8 |
| SI-GATE-NFR-021 | Spletni uporabniški vmesniki morajo izpolnjevati zahteve dostopnosti WCAG 2.1, raven AA (standard EN 301 … | NL PvE NF-8–10; [preveriti: veljavni nacionalni predpis] | M | R1 | UP, UA | `organi`, `vrata.admin` | P | 8 |
| SI-GATE-NFR-022 | Uporabniška aplikacija mora delovati na mobilnih napravah, ki jih uporabljajo nadzorniki na terenu (branje … | TGD §3.3.1; NL PvE NF-3 | P | R1 | UA | `organi` | D | 8 |
| SI-GATE-NFR-023 | Vmesnik mora uporabniku jasno sporočiti uspeh ali napako vsakega dejanja; sporočila »ni odgovora«, »podatki … | NL PvE NF-4; čl. 3(3) | M | R1 | UA, UP | `organi`, `vrata.admin` | D | 8 |
| SI-GATE-NFR-030 | Rešitev mora imeti aktivno spremljanje (grozečih) motenj, napak in zmogljivosti z alarmiranjem upravljavca. | NL PvE NF-12, NF-13 | M | R1 | OP | — | D | 8 |
| SI-GATE-NFR-031 | Izvajalec mora imeti postopek varnostnega kopiranja in obnove, ki ga preizkusi vsaj enkrat letno in o tem … | NL PvE NF-15 | M | R1 | OP | — | P, D | 8 |
| SI-GATE-NFR-032 | Vsaka namestitev nove različice mora imeti preizkušen postopek povrnitve (roll-back). | NL PvE NF-16 | M | R1 | OP | — | D | 8 |
| SI-GATE-NFR-033 | Izguba povezave z enim prehodom ali platformo ne sme vplivati na obdelavo zahtev do drugih prehodov in … | CTG Security (risk #5, #6); [predlog] | M | R1 | PE | `vrata.gateService` | T | 8 |
| SI-GATE-NFR-034 | Asinhrone zahteve se ob okvari ali ponovnem zagonu posameznega vozlišča ne smejo izgubiti (trajna vrsta … | RI (RabbitMQ); [predlog] | M | R1 | PE | `vrata.gateService` | T | 8 |
| SI-GATE-NFR-050 | Rešitev in njeno obratovanje morajo izpolnjevati obveznosti po ZInfV-1 in njegovih podzakonskih aktih, ki … | ZInfV-1 (UL RS 40/25); NIS2 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-051 | Izvajalec mora imeti vzpostavljen sistem upravljanja informacijske varnosti po ISO/IEC 27001 (certifikat ali … | NL PvE NF-20 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-052 | Izvajalec mora pred prevzemom izdelati oceno tveganj po metodologiji ENISA in modeliranju groženj STRIDE za … | CTG Security (Risk Analysis) | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-053 | Vsi podatki, dnevniki in varnostne kopije se morajo hraniti in obdelovati izključno v EGP; dostop iz tretjih … | NL PvE NF-24, NF-39 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-054 | Osebni podatki (npr. identifikacijske reference uradnikov v dnevnikih) se morajo obdelovati po GDPR in … | čl. 2(5); TGD §9.2; CTG Security (GDPR) | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-055 | Razvoj mora slediti načelom varnosti že v zasnovi (secure by design) in OWASP ASVS, raven 2 [predlog]. | NL PvE NF-27; [predlog] | M | R1 | PE | `vrata.gateService` | P, T | 8 |
| SI-GATE-NFR-056 | MZIE ima pravico do revizije varnosti, kakovosti in finančnih vidikov storitve. | NL PvE NF-43 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-060 | Vsa komunikacija med komponentami mora biti šifrirana; zunanji vmesniki morajo uporabljati TLS 1.2 ali … | TGD §8.1; CTG Security (Testfest: TLS1.2+) | M | R1 | PE, ED, AAP | `organi`, `vrata.ap`, `vrata.gateService` | T | 8 |
| SI-GATE-NFR-061 | Varnostne ključe dostopne točke eDelivery mora izvajalec zamenjati vsaj enkrat letno. | TGD §8.1 | M | R1 | ED, OP | `vrata.ap` | P | 8 |
| SI-GATE-NFR-062 | Prehod mora pred vsako uporabo certifikata preveriti njegovo veljavnost in status preklica (OCSP ali CRL); … | TGD §8.1; CTG Security (risk #1, #7) | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 8 |
| SI-GATE-NFR-063 | Zasebni ključi prehoda morajo biti hranjeni v strojnem varnostnem modulu (HSM) ali enakovredni zaščiteni … | čl. 10(2); TGD §8.1 | M | R1 | ED, OP | `vrata.ap` | P, A | 8 |
| SI-GATE-NFR-064 | Certifikate drugih prehodov mora prehod hraniti v statični shrambi zaupanja; izmenjava certifikatov mora … | TGD §8.2; AG Gate integration (»secure channel«) | M | R1 | ED, OP | `vrata.ap` | P | 8 |
| SI-GATE-NFR-065 | Izvajalec mora imeti postopek za ravnanje ob kompromitaciji ključa ali certifikata (preklic, zamenjava, … | TGD §8.1; CTG Security (backlog #8) | M | R1 | OP | — | P, D | 8 |
| SI-GATE-NFR-070 | Dostop upravljavcev in skrbnikov mora biti mogoč le z večfaktorsko avtentikacijo in po načelu najmanjših … | NL PvE NF-33, NF-34 | M | R1 | UP, OP | `vrata.admin` | P, T | 8 |
| SI-GATE-NFR-071 | Seja uporabnika se mora samodejno končati po največ 15 minutah nedejavnosti [predlog; prilagodi se terenski … | NL PvE NF-35 | M | R1 | UP, UA | `organi`, `vrata.admin` | T | 8 |
| SI-GATE-NFR-072 | Prehod mora omejevati število zahtev po AAP, platformi in prehodu (kvote, omejevanje hitrosti) in zaznavati … | CTG Security (»Account-hijack DoS«, backlog #4, #6) | M | R1 | PE | `vrata.gateService` | T | 8 |
| SI-GATE-NFR-073 | Prehod mora biti zaščiten pred napadi DoS na omrežni ravni (zaščita pred porazdeljenimi napadi, ločena … | CTG Security (backlog #4) | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-074 | Razvojno, testno, predprodukcijsko in produkcijsko okolje morajo biti ločeni; produkcijski podatki se v … | NL PvE NF-31 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-080 | Prehod mora beležiti obvezne podatke iz TGD §9.2, tab. 6, in strukturo dnevnika iz TGD Annex 1; poleg zahtev … | čl. 6(2)(c), 6(2)(g); TGD §9.2 | M | R1 | PE | `vrata.gateService` | T | 8 |
| SI-GATE-NFR-081 | Vsak zapis mora imeti časovni žig z natančnostjo vsaj milisekunde in časovnim pasom; prehod mora hraniti … | TGD §9.3 (1) | M | R1 | PE | `vrata.gateService` | T | 8 |
| SI-GATE-NFR-082 | Revizijske sledi morajo biti zaščitene pred spremembo in izbrisom (npr. shranjevanje WORM, veriženje … | TGD §9.3 (3), (7) | M | R1 | PE, OP | `vrata.gateService` | T, P | 8 |
| SI-GATE-NFR-083 | Dostop do dnevnikov morajo imeti le identificirani, avtenticirani in pooblaščeni uporabniki z vlogami; vsak … | TGD §9.4; NL PvE NF-39 | M | R1 | UP, OP | `vrata.admin` | T | 8 |
| SI-GATE-NFR-084 | Izvajalec mora na zahtevo pristojnega organa iz dnevnikov pripraviti človeku berljiv izpis za posamezno … | TGD §9.4 | M | R1 | UP, OP | `vrata.admin` | D | 8 |
| SI-GATE-NFR-085 | Varnostni dogodki in dogodki aktivnosti uporabnikov (tudi skrbnikov) se morajo posredovati v sistem za … | NL PvE NF-38, NF-40 | M | R1 | OP | — | D | 8 |
| SI-GATE-NFR-090 | Pred prevzemom in nato vsaj enkrat letno mora neodvisni izvajalec opraviti penetracijski test; ugotovitve … | NL PvE NF-36; CTG Security (Testfest Security) | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-091 | Izvajalec mora imeti postopek upravljanja ranljivosti s spremljanjem odvisnosti (tudi referenčne … | NL PvE NF-37, NF-50–51; [predlog] | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-092 | Izvajalec mora varnostni incident, ki vpliva na razpoložljivost, zaupnost ali celovitost, sporočiti MZIE … | NL PvE NF-41; ZInfV-1 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-093 | Izvajalec mora imeti načrt odzivanja na incidente z razvrstitvijo in analizo vzrokov, usklajen z incidentnim … | NL PvE NF-42; TG1.3 (Praga) | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-100 | Izvajalec mora uporabljati neprekinjeno integracijo in dostavo (CI/CD) z avtomatiziranimi testi enot, … | NL PvE NF-46, NF-47 | M | R1 | OP | — | P, D | 8 |
| SI-GATE-NFR-101 | Predprodukcijsko okolje mora biti po funkcionalnosti in zmogljivosti reprezentativno za produkcijo in … | NL PvE NF-48; TG2.2 (Praga) | M | R1 | OP | — | D | 8 |
| SI-GATE-NFR-102 | Izvajalec mora zagotoviti testne nadomestke (stubs) za platforme, tuje prehode in AAP (npr. simulator iz … | NL PvE NF-49; RI (platform-gate-simulator) | M | R1 | OP | — | D | 8 |
| SI-GATE-NFR-103 | Izvajalec mora spremljati izdaje referenčne implementacije in sheme XSD (TG2.2, CTG Data Model & Interfaces) … | ADR-0002; TG2.2 načrt izdaj | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-104 | Upravljanje sprememb mora slediti priznanemu okviru (npr. ITIL) z evidenco, oceno tveganja in postopkom … | NL PvE NF-57–59; TG1.3 (ITIL) | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-105 | Ob vsaki izdaji mora izvajalec predati posodobljeno dokumentacijo, opombe ob izdaji in poročila o testiranju. | NL PvE NF-45, NF-62 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-120 | Služba za pomoč izvajalca mora biti enotna kontaktna točka za prijave motenj in zahtevkov za prehod. | NL PvE NF-67 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-121 | Razpoložljivost službe za pomoč mora vsaj ustrezati čl. 12(4) (delavniki 10.00–16.00 CET/CEST; dežurstvo ob … | čl. 12(4); TGD §10.2 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-122 | Za vsaj 90 % prijav na prvi ravni mora biti začetni odziv v 15 minutah in prvi stik v 30 minutah znotraj … | TG1.3 (Praga) | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-123 | Odzivni in rešitveni časi morajo biti določeni po prioritetah v pogodbi o ravni storitev (SLA); prioriteta … | NL PvE NF-69; TG1.3 C4 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-124 | Orodje za prijave mora podpirati izmenjavo prijav z drugimi službami (lastna oznaka, oznaka vira, oznaka … | čl. 12(5); TG1.3 C5, C8 | M | R1 | OP | — | D | 8 |
| SI-GATE-NFR-130 | Prehod mora ob 60-sekundni zakonski meji dodati k času odgovora platforme ali drugega prehoda največ **1 s** … | čl. 3(3)(d), 6(2)(f); ICD v0.5 §10; [predlog] | M | R1 | PE | `vrata.gateService` | T | 8 |
| SI-GATE-NFR-131 | Lokalno iskanje v registru identifikatorjev mora vrniti rezultat v največ **1 s** pri 95 % iskanj [predlog]. | [predlog] | M | R1 | RID | `vrata.gateService.roi` | T | 8 |
| SI-GATE-NFR-132 | Rešitev mora biti horizontalno razširljiva brez prekinitve storitve in dimenzionirana na obremenitev iz … | CTG Security (risk #6, Performance track); [predlog] | M | R1 | PE, OP | `vrata.gateService` | T | 8 |
| SI-GATE-NFR-133 | Prehod mora prenesti konice zahtev ob terenskih nadzorih (sočasna iskanja po identifikatorjih, ki se … | CTG Security (Testfest Performance) | M | R1 | PE | `vrata.gateService` | T | 8 |
| SI-GATE-NFR-140 | Izvajalec mora v 5 delovnih dneh po koncu meseca predložiti poročilo o storitvah: razpoložljivost, prijave s … | NL PvE NF-75–78 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-141 | Izvajalec mora MZIE zagotoviti podatke o delovanju za nacionalno kontaktno točko eFTI in poročanje v mreži … | čl. 12(6), 13(3)(a) | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-142 | Prehod mora za vsako koledarsko leto zagotoviti statistiko števila zahtev pristojnih organov za dostop do … | čl. 17 Uredbe (EU) 2020/1056 | M | R1 | PE, UP | `vrata.admin`, `vrata.gateService` | D | 8 |
| SI-GATE-NFR-150 | MZIE postane lastnik izvorne kode, konfiguracije in dokumentacije rešitve ob predaji; uporabljene … | NL PvE NF-84; ADR-0002 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-151 | Ob prenehanju pogodbe mora izvajalec brezplačno predati vso izvorno kodo in podatke v izvirnih, trajnih … | NL PvE NF-83 | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-152 | Rešitev mora biti nameščljiva v standardnih vsebnikih (npr. OCI) in prenosljiva med okolji gostovanja brez … | NL PvE NF-81; RI (Docker) | M | R1 | PE, OP | `vrata.gateService` | D | 8 |
| SI-GATE-NFR-153 | Rešitev mora biti predana v produkcijo in v upravljanje MZIE najpozneje do 9. 7. 2027 (časovni načrt v pogl. … | NL PvE NF-85; čl. 5(1) Uredbe (EU) 2020/1056 (datum izpeljan v 10.1) | M | R1 | OP | — | P | 8 |
| SI-GATE-NFR-200 | Izvajalec mora v 30 dneh po podpisu pogodbe [predlog] predložiti testni načrt z ravnmi iz 9.1, testnimi … | AG #8; [predlog] | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-201 | Vsaka zahteva z načinom preverjanja T ali D mora imeti vsaj en testni primer; poročilo o testiranju mora za … | Priloga C | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-202 | Avtomatizirani testi skladnosti z XSD in vmesniki #1–#3 morajo biti del CI in se izvesti ob vsaki spremembi … | SI-GATE-NFR-100 | M | R1 | OP | — | D | 9 |
| SI-GATE-NFR-203 | Izvajalec mora za teste uporabljati sintetične ali anonimizirane testne podatke; produkcijski podatki niso … | AG #8 (zbiranje nacionalnih testnih podatkov) | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-210 | Izvajalec mora vzpostaviti ločena razvojno, testno, predprodukcijsko in produkcijsko okolje … | NL PvE NF-31, NF-48 | M | R1 | OP | — | P, D | 9 |
| SI-GATE-NFR-211 | Testno ali predprodukcijsko okolje mora biti trajno povezano v integracijsko omrežje eFTI4LIVE (dostopna … | AG #5; TG2.3 (Praga) | M | R1 | ED, OP | `vrata.ap` | D | 9 |
| SI-GATE-NFR-212 | Okolje mora vsebovati simulatorje platform, tujih prehodov in AAP (npr. iz RI) za samostojne in … | RI platform-gate-simulator; NL PvE NF-49 | M | R1 | OP | — | D | 9 |
| SI-GATE-NFR-213 | Izvajalec mora drugim prehodom in slovenskim platformam objaviti podatke za priklop testnega prehoda (URL … | AG #5 (pričakovani rezultati) | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-220 | Prehod mora pred vstopom v integracijsko mrežo prehodov uspešno izvesti vse testne scenarije proti RI kot … | TG2.2 (Praga, »hub-and-spoke«); SI-GATE-NFR-010 | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 9 |
| SI-GATE-NFR-221 | Prehod mora opraviti TCT in varnostne teste v Launchpadu (ali enakovrednem okolju, ki ga določi EK) in … | TG2.2 Launchpad (stalno zagotavljanje); SI-GATE-NFR-011 | M | R1 | PE | `vrata.gateService` | T | 9 |
| SI-GATE-NFR-222 | Izvajalec mora prehod prijaviti na prvo skupno testiranje (Testfest) integracijskega omrežja, ki se začne po … | TG2.3 (Praga, časovnica integracije vrat) | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-223 | Prehod mora pred produkcijo uspešno izmenjati realna sporočila (zahteve in odgovori, vključno z eDelivery) … | AG #8; [predlog] | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 9 |
| SI-GATE-NFR-224 | Testni scenariji morajo pokrivati teme delovne skupine za testiranje: vmesnike, odkrivanje in usmerjanje, … | Praga, AG #8 (16 podtem funkcionalnih testov) | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-240 | Izvajalec mora pred prevzemom izvesti obremenitvene teste z vnaprej dogovorjenimi merili (odzivni časi, … | CTG Security (Performance track: »merimo, ne domnevamo«); SI-GATE-NFR-130–133 | M | R1 | PE | `vrata.gateService` | T | 9 |
| SI-GATE-NFR-241 | Varnostni testi morajo pokrivati vsaj: identiteto, zaupanje in pravice dostopa; preverjanje certifikatov … | CTG Security (Testfest Security track; AG #8: 17 podtem) | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 9 |
| SI-GATE-NFR-242 | Vsako tveganje visoke ali kritične stopnje iz ocene tveganj (SI-GATE-NFR-052) mora imeti testni primer in … | CTG Security (»vsako kritično tveganje → testni primer«) | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-243 | Penetracijski test pred prevzemom (SI-GATE-NFR-090) mora vključevati vse zunanje vmesnike (#1, #2, #3, … | NL PvE NF-36 | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-250 | Izvajalec mora podpreti priklop vsaj ene slovenske platforme eFTI (npr. pilotna platforma eFTI4LIVE) v … | SI pilot (D2.1, dec. 2025) | M | R1 | PE, ED | `vrata.ap`, `vrata.gateService` | T | 9 |
| SI-GATE-NFR-251 | Izvajalec mora s pristojnimi organi izvesti uporabniški prevzemni test (UAT) PU-CA-1 do PU-CA-4 v … | SI implementacijski načrt (pristojni organi); [predlog] | M | R1 | PE, AAP, UA | `organi`, `vrata.gateService` | T | 9 |
| SI-GATE-NFR-252 | Izvajalec mora podpreti pilotne scenarije z več načini prevoza (cesta, železnica, multimodalno) iz … | SI pilot (D2.1) | P | R1 | PE | `vrata.gateService` | T | 9 |
| SI-GATE-NFR-253 | Rezultati pilotov morajo biti pripravljeni tako, da jih MZIE lahko poroča v eFTI4LIVE (T2.4: kazalniki, npr. … | T2.4 (Praga, KPI) | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-260 | Prevzem mora potekati po fazah F1–F5 in končnem prevzemu iz 9.6; vsaka faza se zaključi s pisnim zapisnikom, … | [predlog] | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-261 | Napake se razvrščajo v kritične, visoke, srednje in nizke [predlog]; za prehod v naslednjo fazo ne sme biti … | NL PvE NF-64; [predlog] | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-262 | Produkcijski zagon (konec F4) mora biti najpozneje 9. 7. 2027; časovnica faz se uskladi z integracijskim … | TG2.3 (Praga); SI-GATE-NFR-153 | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-263 | Ob prevzemu mora izvajalec predati: izvorno kodo, namestitvene artefakte, konfiguracijo, arhitekturni opis … | NL PvE NF-45, NF-83; SI-GATE-NFR-150 | M | R1 | OP | — | P | 9 |
| SI-GATE-NFR-280 | Prehod mora imeti postopek priklopa platforme (onboarding): vloga upravljavca platforme, preverjanje … | čl. 6(3)(f); TGD §8.3 | M | R1 | UP, OP | `vrata.admin` | D | 9 |
| SI-GATE-NFR-281 | Prehod mora zagotoviti okolje, v katerem platforma pred priklopom izvede usklajene testne scenarije TCT za … | M2.3 (decentraliziran TCT); osnutek DU o certificiranju | M | R2 | PE, TCT | `vrata.gateService`, `vrata.tct` | D | 9 |
| SI-GATE-NFR-282 | Prehod mora tehnično podpirati priklop platform glede na status v registru platform: »certificirana« in, če … | M2.3; Praga (pismo EK, stališča DČ) | M | R1 | PE, UP | `vrata.admin`, `vrata.gateService` | D | 9 |
| SI-GATE-NFR-283 | Prehod mora spremljati delež napak v izmenjavi s posamezno platformo (format, obvezna polja, protokol) in ob … | M2.3 (spremljanje v produkciji) | M | R1 | PE, UP | `vrata.admin`, `vrata.gateService` | T | 9 |
| SI-GATE-NFR-284 | Register platform mora podpirati postopek iz čl. 6(4) za platforme, certificirane v drugih DČ … | čl. 6(4) | M | R1 | UP | `vrata.admin` | D | 9 |
| SI-GATE-NFR-300 | Izvajalec mora rešitev izdelati v fazah iz 10.5 in v 10 delovnih dneh po podpisu pogodbe [predlog] … | 10.2; [predlog] | M | R1 | OP | — | P | 10 |
| SI-GATE-NFR-301 | Izvajalec mora v 3 tednih po podpisu pogodbe [predlog] vzpostaviti testni prehod (na osnovi RI ali lastni) v … | TG2.2, TG2.3 (Praga); [predlog] | M | R1 | PE, OP | `vrata.gateService` | D | 10 |
| SI-GATE-NFR-302 | Izdaja R1 mora biti v produkciji in prevzeta (F1–F4) najpozneje 9. 7. 2027. | čl. 5(1) Uredbe (EU) 2020/1056 | M | R1 | OP | — | P | 10 |
| SI-GATE-NFR-303 | Izdaja R2 mora biti v produkciji najpozneje 6 mesecev po zagonu [predlog]. | [predlog] | M | R1 | OP | — | P | 10 |
| SI-GATE-NFR-304 | Po zagonu mora izvajalec spremembe uvajati v ciklu, usklajenem s 6-mesečnim ciklom izdaj EU (delegirani akt … | časovnica integracijskega omrežja (9. 11. 2026) | M | R1 | OP | — | P | 10 |
| SI-GATE-NFR-305 | Izvajalec mora MZIE vsaka dva tedna poročati o napredku glede na kritično pot (10.3) in o odvisnostih od EU … | [predlog] | M | R1 | OP | — | P | 10 |
