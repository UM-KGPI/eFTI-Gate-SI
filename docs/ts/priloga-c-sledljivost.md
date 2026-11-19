# Priloga C: Matrika sledljivosti zahtev (oznaka zahteve, vir, preverjanje)

> **Generirano** s `scripts/build-traceability.py` iz tabel zahtev v poglavjih; ne urejaj ročno.
>
> Število zahtev: 122. Pomen stolpcev P, Komp. in Preverjanje: pogl. 6.0.

| Oznaka | Kratek opis | Vir | P | Komp. | Preverjanje | Pogl. |
|---|---|---|---|---|---|---|
| SI-GATE-FR-001 | Sistem mora uradniku pristojnega organa omogočiti dostop do podatkov eFTI z neposredno obdelavo UIL, ki jo … | čl. 2(1)(a) | M | PE, UA | T | 6 |
| SI-GATE-FR-002 | Sistem mora omogočiti pridobitev UIL iz registra identifikatorjev na podlagi identifikatorja, povezanega s … | čl. 2(1)(b) | M | IM, RI, UA | T | 6 |
| SI-GATE-FR-003 | Sistem mora ob vsaki zahtevi za dostop do podatkov eFTI zagotoviti avtentificirano identifikacijo in … | čl. 2(2)(a) | M | AAP, RD | T | 6 |
| SI-GATE-FR-004 | Sistem mora posredovati zahteve uradnikov, vključno s pridobivanjem zahtevanih informacij od ustrezne … | čl. 2(2)(b) | M | PE, ED | T | 6 |
| SI-GATE-FR-005 | Rešitev mora vsebovati vsaj komponente: dostopovne točke organov, register dovoljenj, prehod eFTI, iskalni … | čl. 2(3) | M | vse | P | 6 |
| SI-GATE-FR-006 | Izvajalec mora zagotoviti vzpostavitev, gostovanje, razvoj, razpoložljivost, spremljanje, posodabljanje in … | čl. 2(4) | M | OP | P | 6 |
| SI-GATE-FR-007 | Sistem mora dostop do podatkov eFTI in njihovo obdelavo omejiti na namene preverjanja skladnosti in ga … | čl. 2(5) | M | AAP, RD, PE | T, P | 6 |
| SI-GATE-FR-010 | Uradnik mora vse zahteve za dostop vložiti v uporabniški aplikaciji preko dostopovne točke organa; prehod … | čl. 3(1), čl. 4(1) | M | AAP, UA, PE | T | 6 |
| SI-GATE-FR-011 | Zahteva za dostop mora vsebovati UIL ali enega ali več identifikatorjev za pridobitev UIL iz registra … | čl. 3(2)(a) | M | UA, PE | T | 6 |
| SI-GATE-FR-012 | Uporabniška aplikacija mora zahtevi samodejno dodati sklice na pravice dostopa uradnika iz registra dovoljenj. | čl. 3(2)(b) | P | UA, RD | T | 6 |
| SI-GATE-FR-013 | Zahteva mora vsebovati edinstveno identifikacijsko številko, ki jo izda AAP; uporabniška aplikacija jo doda … | čl. 3(2)(c) | M | AAP, UA | T | 6 |
| SI-GATE-FR-014 | Sistem mora podpirati odgovor s podatki eFTI in metapodatki oziroma identifikatorji sporočil, ki prehodom in … | čl. 3(3)(a) | M | PE, AAP | T | 6 |
| SI-GATE-FR-015 | Sistem mora podpirati sporočila o napaki s kodirano ali kratko besedilno specifikacijo vrste napake, kadar … | čl. 3(3)(b) | M | PE | T | 6 |
| SI-GATE-FR-016 | Prehod eFTI, ki prejme zahtevo z identifikatorji, mora izdati sporočilo, da podatki niso na voljo, kadar … | čl. 3(3)(c) | M | PE, IM | T | 6 |
| SI-GATE-FR-017 | Sistem mora podpirati sporočilo »ni odgovora«, kadar prehod ali platforma potrdi prejem zahteve, a v 60 … | čl. 3(3)(d) | M | PE | T | 6 |
| SI-GATE-FR-018 | Uporabniška aplikacija mora uradniku omogočiti vložitev sporočila o nadaljnjem ukrepanju, kadar ugotovi, da … | čl. 3(4) | P | UA | D | 6 |
| SI-GATE-FR-019 | Sporočilo o nadaljnjem ukrepanju se mora posredovati preko AAP in vsebovati informacije za gospodarski … | čl. 3(5) | M | AAP, UA, PE | T | 6 |
| SI-GATE-FR-030 | AAP mora biti edina točka dostopa uradnika do okolja za izmenjavo eFTI. | čl. 4(1) | P | AAP | A, T | 6 |
| SI-GATE-FR-031 | AAP mora avtentificirati identiteto uradnika ali zagotoviti, da jo avtentificira druga ustrezna komponenta. | čl. 4(2)(a), 4(3)(a) | P | AAP | T | 6 |
| SI-GATE-FR-032 | AAP mora zahtevo odobriti na podlagi pravic dostopa iz registra dovoljenj ali jo zavrniti, če uradnik nima … | čl. 4(2)(b) | P | AAP, RD | T | 6 |
| SI-GATE-FR-033 | AAP mora vsako odobreno zahtevo registrirati z edinstveno identifikacijsko številko in evidentirati vsaj: … | čl. 4(2)(c) | P | AAP | T | 6 |
| SI-GATE-FR-034 | AAP mora odobreno zahtevo poslati prehodu eFTI z edinstveno številko zahteve, UIL ali identifikatorji in … | čl. 4(2)(d) | P | AAP | T | 6 |
| SI-GATE-FR-035 | AAP mora odgovore prehoda prejeti in jih preko uporabniške aplikacije dati na voljo odgovornemu uradniku. | čl. 4(2)(e) | P | AAP, UA | T | 6 |
| SI-GATE-FR-036 | AAP mora za vsak odgovor voditi revizijsko sled: številka zahteve, datum in čas prejema odgovora, datum in … | čl. 4(2)(f) | P | AAP | T | 6 |
| SI-GATE-FR-037 | AAP mora arhiv zahtev in dnevnik odgovorov hraniti dve leti ali dlje, če to določajo nacionalni predpisi o … | čl. 4(2)(g) | P | AAP | P, T | 6 |
| SI-GATE-FR-038 | AAP mora vsako sporočilo o nadaljnjem ukrepanju registrirati z edinstveno številko in evidentirati: … | čl. 4(2)(h) | P | AAP | T | 6 |
| SI-GATE-FR-039 | AAP mora sporočilo o nadaljnjem ukrepanju poslati prehodu eFTI z UIL, številko izvorne zahteve in vsebino … | čl. 4(2)(i) | P | AAP | T | 6 |
| SI-GATE-FR-040 | AAP mora uporabljati sredstva elektronske identifikacije, ki omogočajo zanesljivo identifikacijo in … | čl. 4(3)(a) | P | AAP | P, T | 6 |
| SI-GATE-FR-041 | AAP mora vzpostaviti in ohranjati varno povezavo s prehodom eFTI ter podpirati varno povezavo z uporabniško … | čl. 4(3)(c), 4(3)(d) | M | AAP, PE | T | 6 |
| SI-GATE-FR-060 | Register dovoljenj mora za vsakega uradnika hraniti edinstveno identifikacijsko referenco. | čl. 5(a) | P | RD | T | 6 |
| SI-GATE-FR-061 | Register dovoljenj mora hraniti pravice dostopa kot seznam sklicev na pravne akte EU in nacionalne pravne … | čl. 5(b) | P | RD | T, P | 6 |
| SI-GATE-FR-062 | Register dovoljenj mora hraniti pravice obdelave kot kodirane sklice na postopke obdelave za vsak podsklop … | čl. 5(c) | P | RD | T | 6 |
| SI-GATE-FR-063 | Register dovoljenj mora voditi dnevnik sprememb pravic dostopa in pravic obdelave. | čl. 5(d) | P | RD | T | 6 |
| SI-GATE-FR-070 | Prehod eFTI mora neposredno ali preko drugih prehodov zagotoviti, da se odobrene zahteve z zahtevanimi … | čl. 6(1)(a) | M | PE, ED | T | 6 |
| SI-GATE-FR-071 | Prehod eFTI mora odgovor platforme posredovati uporabniški aplikaciji odgovornega uradnika, neposredno ali … | čl. 6(1)(b) | M | PE | T | 6 |
| SI-GATE-FR-072 | Prehod eFTI mora sporočilo o nadaljnjem ukrepanju posredovati platformi eFTI, ki hrani podatke izvorne … | čl. 6(1)(c) | M | PE, ED | T | 6 |
| SI-GATE-FR-073 | Kot »prehod, ki zahteva dostop«, pri AAP kot ločeni komponenti, mora prehod potrditi zahtevo ali sporočilo o … | čl. 6(2)(a)(i) | P | PE | T | 6 |
| SI-GATE-FR-074 | Kot »prehod, ki prejme zahtevo« mora prehod potrditi zahtevo ali sporočilo o nadaljnjem ukrepanju s … | čl. 6(2)(a)(ii) | M | PE, ED | T | 6 |
| SI-GATE-FR-075 | Če preverjanje ključa ni uspešno, mora prehod poslati sporočilo o napaki prehodu, ki zahteva dostop, AAP ali … | čl. 6(2)(a)(iii) | M | PE | T | 6 |
| SI-GATE-FR-076 | Prehod mora zahtevo ali sporočilo o nadaljnjem ukrepanju obdelati z iskalnim mehanizmom in ga posredovati: … | čl. 6(2)(b) | M | PE, IM | T | 6 |
| SI-GATE-FR-077 | Prehod mora za vsako obdelano zahtevo ali sporočilo o nadaljnjem ukrepanju voditi revizijsko sled vsaj z: … | čl. 6(2)(c) | M | PE | T | 6 |
| SI-GATE-FR-078 | Ob odgovoru neposredno od platforme mora prehod preveriti varnostni ključ **in certifikacijski status** … | čl. 6(2)(d)(i) | M | PE | T | 6 |
| SI-GATE-FR-079 | Ob odgovoru od prehoda, ki prejme zahtevo, mora prehod preveriti njegov varnostni ključ na podlagi registra … | čl. 6(2)(d)(ii) | M | PE, ED | T | 6 |
| SI-GATE-FR-080 | Če preverjanje ključa ali certifikacijskega statusa ni uspešno, mora prehod poslati ustrezno sporočilo o … | čl. 6(2)(d)(iii) | M | PE | T | 6 |
| SI-GATE-FR-081 | Prehod mora odgovor posredovati po isti poti v obratnem zaporedju: prehodu, ki zahteva dostop, ali … | čl. 6(2)(e) | M | PE | T | 6 |
| SI-GATE-FR-085 | Če je prejeta potrditev prejema zahteve, drug odgovor pa ne v 60 sekundah od potrditve, mora prehod poslati … | čl. 6(2)(f) | M | PE | T | 6 |
| SI-GATE-FR-086 | Prehod mora za vsak posredovani odgovor voditi revizijsko sled vsaj z: UIL prejetega sklopa podatkov, … | čl. 6(2)(g) | M | PE | T | 6 |
| SI-GATE-FR-087 | Prehod mora evidence iz SI-GATE-FR-077 in SI-GATE-FR-086 arhivirati in hraniti za revizijo dve leti ali … | čl. 6(2)(h) | M | PE, OP | P, T | 6 |
| SI-GATE-FR-090 | Prehod mora vzpostaviti in ohranjati varno povezavo z AAP slovenskih pristojnih organov. | čl. 6(3)(b) | M | PE | T | 6 |
| SI-GATE-FR-091 | Kadar so AAP integrirane v prehod, mora prehod vzpostaviti in ohranjati varno povezavo z uporabniškimi … | čl. 6(3)(c), 6(3)(d) | M | PE, UP | T, D | 6 |
| SI-GATE-FR-092 | Prehod mora vzpostaviti in ohranjati varno povezavo z vsemi drugimi prehodi eFTI in posodobljen register z … | čl. 6(3)(e) | M | PE, ED, UP | T, D | 6 |
| SI-GATE-FR-093 | Prehod mora vzpostaviti in ohranjati varno povezavo z vsemi platformami eFTI, certificiranimi v Sloveniji, … | čl. 6(3)(f) | M | PE, ED, UP | T, D | 6 |
| SI-GATE-FR-094 | Prehod mora omogočati uporabo splošno opredeljenih storitev in ključnih elementov (konfiguracija, kode … | čl. 6(3)(g) | M | PE | P, D | 6 |
| SI-GATE-FR-095 | Dokler v Sloveniji noben organ za ugotavljanje skladnosti ni akreditiran za certifikacijo platform, mora … | čl. 6(4) | M | PE, UP, OP | D, P | 6 |
| SI-GATE-FR-110 | Uporabniška aplikacija mora ustvariti zahtevo na podlagi informacij uradnika, potem ko AAP uradnika … | čl. 7(2)(a) | P | UA | T | 6 |
| SI-GATE-FR-111 | Uporabniška aplikacija mora prejeti podatke eFTI, sporočilo »ni odgovora« ali sporočilo o napaki in jih … | čl. 7(2)(b) | P | UA | T, D | 6 |
| SI-GATE-FR-112 | Uporabniška aplikacija mora omogočiti druge postopke obdelave prejetih podatkov v skladu s pravicami … | čl. 7(2)(c) | P | UA | T | 6 |
| SI-GATE-FR-113 | Kadar nacionalni predpisi to omogočajo, mora uporabniška aplikacija ustvariti sporočila o nadaljnjem … | čl. 7(2)(d) | P | UA | D | 6 |
| SI-GATE-FR-114 | Uporabniška aplikacija mora zagotavljati grafični uporabniški vmesnik, varno povezavo z AAP ali prehodom in … | čl. 7(3) | P | UA | D, T | 6 |
| SI-GATE-FR-120 | Iskalni mehanizem mora biti vgrajen v prehod eFTI. | čl. 8(1) | M | IM | P | 6 |
| SI-GATE-FR-121 | Iskalni mehanizem mora iz UIL pridobiti identifikator platforme, ki hrani podatke, oziroma identifikator … | čl. 8(1)(a) | M | IM | T | 6 |
| SI-GATE-FR-122 | Če zahteva vsebuje identifikatorje iz čl. 11(3), mora iskalni mehanizem iskati v registru identifikatorjev; … | čl. 8(1)(b) | M | IM, RI | T | 6 |
| SI-GATE-FR-123 | Iskalni mehanizem mora upravljati register identifikatorjev v skladu s čl. 11. | čl. 8(2)(a) | M | IM, RI | T | 6 |
| SI-GATE-FR-124 | Iskalni mehanizem mora za odkrivanje platform uporabljati SMP in SML v skladu s specifikacijami eDelivery … | čl. 8(2)(b) | M | IM, ED | T | 6 |
| SI-GATE-FR-130 | Prehod, AAP in uporabniška aplikacija morajo komunicirati v standardizirani obliki za izmenjavo sporočil. | čl. 9(1) | M | PE, AAP, UA | P, T | 6 |
| SI-GATE-FR-131 | Komunikacija med prehodi ter med prehodom in platformami mora potekati v obliki XML (veljavna verzija sheme … | čl. 9(1) | M | PE, ED | T | 6 |
| SI-GATE-FR-132 | Vsa komunikacija med prehodi mora potekati preko dostopovnih točk eDelivery po specifikacijah za izmenjavo … | čl. 9(2) | M | ED | T | 6 |
| SI-GATE-FR-133 | Za komunikacijo med prehodom in platformami mora biti omogočena izmenjava preko dostopovnih točk eDelivery z … | čl. 9(3) | M | ED | T | 6 |
| SI-GATE-FR-134 | Če MZIE odloči, da poleg eDelivery dovoli tudi enakovredne nacionalno opredeljene specifikacije za … | čl. 9(4) | P | PE, OP | P | 6 |
| SI-GATE-FR-140 | Dostopni točki eDelivery prehoda in dostopnim točkam platform, certificiranih v Sloveniji, se morajo izdati … | čl. 10(1) | M | ED, OP | P | 6 |
| SI-GATE-FR-141 | Zasebni ključi dostopne točke eDelivery prehoda morajo biti varno shranjeni (npr. HSM ali enakovredna … | čl. 10(2) | M | ED, OP | P, A | 6 |
| SI-GATE-FR-142 | Rešitev mora zagotavljati varne mehanizme za prejemanje, evidentiranje, pridobivanje in potrjevanje javnih … | čl. 10(3) | M | UP, ED | D, T | 6 |
| SI-GATE-FR-150 | Register identifikatorjev mora platformam omogočiti nalaganje UIL skupaj z identifikatorji ter nalaganje, … | čl. 11(1) | M | RI | T | 6 |
| SI-GATE-FR-151 | Prehod mora iz UIL razbrati identifikator prehoda, identifikator platforme in UUID sklopa podatkov, ki ga … | čl. 11(2) | M | IM, RI | T | 6 |
| SI-GATE-FR-152 | Prehod mora imeti identifikator, ki omogoča enoznačno odkrivanje v okolju eFTI (dogovor o poimenovanju: ICD … | čl. 11(2)(a) | M | PE, OP | P | 6 |
| SI-GATE-FR-153 | Register identifikatorjev mora podpirati vsaj identifikatorje eFTI39, eFTI188, eFTI374, eFTI378, eFTI448, … | čl. 11(3) | M | RI | T | 6 |
| SI-GATE-FR-154 | Register identifikatorjev mora UIL aktivirati in dati na voljo za poizvedbe takoj po nalaganju ter jo … | čl. 11(4) | M | RI | T | 6 |
| SI-GATE-FR-155 | Za UIL, pri katerih ima eFTI581 vrednost »3« (cestni prevoz), mora register UIL deaktivirati šele po izteku … | čl. 11(4) | M | RI | T | 6 |
| SI-GATE-FR-156 | Po deaktivaciji mora register UIL in z njo povezane identifikatorje izbrisati. | čl. 11(4) | M | RI | T | 6 |
| SI-GATE-FR-170 | Rešitev mora podpirati službo za pomoč uporabnikom na prvi ravni (za uradnike) in na drugi ravni (za službe … | čl. 12(1) | M | OP | P | 6 |
| SI-GATE-FR-171 | Službe za pomoč morajo biti na voljo ob delavnikih vsaj med 10.00 in 16.00 (CET/CEST), razen ob praznikih; … | čl. 12(4) | M | OP | P | 6 |
| SI-GATE-FR-172 | Služba za pomoč mora uporabljati orodje, ki omogoča enotno identifikacijo vsake prošnje in nadaljnje … | čl. 12(5) | M | OP | D | 6 |
| SI-GATE-FR-173 | Služba za pomoč mora voditi dnevnike vseh prošenj in njihove zgodovine ter redno poročati o dejavnostih. | čl. 12(6) | M | OP | P | 6 |
| SI-GATE-FR-174 | Službe za pomoč morajo biti na voljo od datuma iz čl. 5(1) Uredbe (EU) 2020/1056. | čl. 12(8) | M | OP | P | 6 |
| SI-GATE-FR-175 | Izvajalec mora nacionalni kontaktni točki eFTI (čl. 13(2)) zagotavljati podatke o stanju delovanja … | čl. 13(3)(a) | M | OP | P | 6 |
| SI-GATE-FR-200 | Prehod mora podpirati obe vlogi, »prehod, ki zahteva dostop« in »prehod, ki prejme zahtevo«, za vse vrste … | čl. 1(13), 1(14); TGD §3.3 | M | PE | T | 7 |
| SI-GATE-FR-201 | Prehod mora iskanje po identifikatorjih posredovati vsem prehodom v registru prehodov; kot nastavljivo … | TGD §6.2 | M | PE, IM | T | 7 |
| SI-GATE-FR-202 | Prehod mora odgovoriti na vsako iskanje, ki ga prejme od drugega prehoda. | TGD §6.2 | M | PE, IM | T | 7 |
| SI-GATE-FR-203 | Pri sinhronem načinu mora prehod delne rezultate združiti v en odgovor s statusom vsakega prehoda (COMPLETE, … | TGD §6.3 | M | PE | T | 7 |
| SI-GATE-FR-204 | Prehod mora pri posredovanju prek več prehodov ohraniti korelacijski identifikator zahteve od AAP do … | ICD v0.5 §4.2, §6.3 | M | PE | T | 7 |
| SI-GATE-FR-205 | Napake, prejete od drugega prehoda, mora prehod posredovati nespremenjene v običajni vrsti odgovora. (osnutek) | ICD v0.5 §11 | M | PE | T | 7 |
| SI-GATE-FR-210 | Prehod mora nabor identifikatorjev sprejeti le, če obstajajo vsi obvezni identifikatorji in so tip ter … | TGD §6.1 | M | RI | T | 7 |
| SI-GATE-FR-211 | Pri nalaganju za UIL, ki že obstaja, mora prehod nov nabor identifikatorjev zamenjati s starim (ne … | TGD §6.1 | M | RI | T | 7 |
| SI-GATE-FR-212 | Prehod mora zapis deaktivirati in izbrisati tudi ob posodobitvi identifikatorja eFTI596 (dejanski datum … | TGD §6.1 | P | RI | T | 7 |
| SI-GATE-FR-213 | Nabor identifikatorjev registra mora biti nastavljiv brez spremembe programske kode, da se lahko uvede … | TGD §6.4, tab. 4 | M | RI | D, T | 7 |
| SI-GATE-FR-214 | Prehod mora nalaganje identifikatorjev sprejeti le od platform z veljavnim certifikacijskim statusom v … | čl. 6(3)(f), 11(1) | M | RI, PE | T | 7 |
| SI-GATE-FR-215 | Prehod mora platformi posredovati pravice dostopa uradnika, tako da platforma lahko vrne le podsklope, za … | čl. 4(2)(d)(iii); TGD §3.3.1 | M | PE | T | 7 |
| SI-GATE-FR-216 | Prehod mora pri zahtevi platformi upoštevati, da mora platforma odgovoriti v 50 s, tako da prehod izpolni 60 … | ICD v0.5 §10 | M | PE | T | 7 |
| SI-GATE-FR-217 | Prehod ne sme zavrniti sklopa podatkov zaradi manjkajočih podatkov; o popolnosti odloči uradnik. Prehod … | ICD v0.5 §12 | M | PE | T | 7 |
| SI-GATE-FR-218 | Prehod mora od platforme sprejeti potrdilo o prejemu sporočila o nadaljnjem ukrepanju in ga posredovati AAP. | TGD §3.3.4 | M | PE | T | 7 |
| SI-GATE-FR-230 | AAP mora za identifikacijo uradnikov uporabljati nacionalne gradnike e-identitete (SI-PASS, SI-CAS, SIGEN-CA … | čl. 4(3)(a); SI implementacijski načrt (20. 5. 2026) | P | AAP | P, T | 7 |
| SI-GATE-FR-231 | Med AAP in prehodom mora potekati medsebojna avtentikacija s certifikati (mTLS ali enakovredno) in … | čl. 6(2)(a)(i), 6(3)(d) | M | PE, AAP | T | 7 |
| SI-GATE-FR-232 | Avtorizacijski žeton ali sporočilo, ki ga AAP posreduje prehodu, mora vsebovati sklice na pravice obdelave … | čl. 4(2)(d)(iii) | M | AAP, PE | T | 7 |
| SI-GATE-FR-233 | Register dovoljenj mora biti mogoče vzdrževati prek programskega vmesnika (sinhronizacija s kadrovskimi … | NL PvE §4.4 | P | RD | D | 7 |
| SI-GATE-FR-240 | Pri sestavljenih iskalnih poljih (uporabljeno prevozno sredstvo, uporabljena ali prevažana prevozna oprema) … | TGD §6.4 | M | IM | T | 7 |
| SI-GATE-FR-241 | Iskanje mora vrniti seznam celotnih zapisov (UIL in identifikatorji) aktivnih sklopov podatkov; register … | TGD §6 | M | IM, RI | T | 7 |
| SI-GATE-FR-242 | Iskanje mora biti enako pri iskanju slovenskega organa in pri iskanju, prejetem od drugega prehoda (enaka … | TGD §6.4 | M | IM | T | 7 |
| SI-GATE-FR-250 | Prehod mora pristojnim organom zagotoviti programski vmesnik (#3) za PU-CA-1 do PU-CA-4 z javno, različicam … | čl. 6(3)(b); ICD v0.5 §3.1 | M | PE (`vrata.caApi`) | P, T | 7 |
| SI-GATE-FR-251 | Vmesnik #3 mora podpirati asinhrono obdelavo: AAP ob zahtevi prejme identifikator in pozneje pridobi odgovor … | TGD §6.3; RI (REST API za organe) | M | PE | T | 7 |
| SI-GATE-FR-252 | Vmesnik #3 mora za podatke uporabljati standardne tipe sporočil eFTI (XSD), kjer je to mogoče. (osnutek) | ICD v0.5 P-01 | P | PE | P | 7 |
| SI-GATE-FR-253 | Vmesnik #3 mora omogočiti zahtevo za določeno različico sklopa podatkov, ki se prenese v kontekstu … | ICD v0.5 §13, P-06 | P | PE | T | 7 |
| SI-GATE-FR-270 | Upravljavska aplikacija mora omogočiti vodenje registra platform (edinstvena številka, varnostni ključi, … | čl. 6(3)(d)–(f) | M | UP | D | 7 |
| SI-GATE-FR-271 | Certifikacijski status platform mora prehod samodejno usklajevati z Unijskim referenčnim seznamom ali … | čl. 6(2)(d)(i), 6(3)(f); AG Union Registry (Praga) | M | PE (`certCheck`), UP | T | 7 |
| SI-GATE-FR-272 | Upravljavska aplikacija mora podpirati postopek priklopa platforme, certificirane v drugi DČ … | čl. 6(4) | M | UP | D | 7 |
| SI-GATE-FR-273 | Upravljavska aplikacija mora upravljavcem omogočiti pregled revizijskih sledi (SI-GATE-FR-077, 086) z … | čl. 6(2)(c), 6(2)(g); TGD §9.4 | M | UP | D | 7 |
| SI-GATE-FR-274 | Prehod mora za nadzor delovanja oddajati metrike (razpoložljivost, odzivni časi, napake po vrstah, število … | TGD §9.2; TG1.3 (Praga) | M | PE, OP | D | 7 |
| SI-GATE-FR-275 | Upravljavska aplikacija mora omogočiti posodobitev skupnih šifrantov, kod napak in konfiguracije, … | čl. 6(3)(g) | M | UP | D | 7 |
| SI-GATE-FR-290 | Dostopna točka eDelivery mora delovati po profilu AS4 in konfiguraciji PMode iz TGD Annex 1 (tabela 13). | čl. 9(2); TGD Annex 1 | M | ED | T | 7 |
| SI-GATE-FR-291 | Za #1 (G2G) mora uporabljati statično odkrivanje, za #2 (G2P) dinamično odkrivanje prek SML/SMP. | čl. 9(2), 9(3) | M | ED | T | 7 |
| SI-GATE-FR-292 | Identifikatorji strank in končnih točk morajo slediti dogovorjenim pravilom poimenovanja (ICD v0.5 P-22; … | ICD v0.5 §6.1 | M | ED, OP | P | 7 |
| SI-GATE-FR-293 | Povezovalnik mora preslikati korelacijske identifikatorje v glavo AS4 (MessageId, ConversationId, … | ICD v0.5 §8.4 | M | PE, ED | T | 7 |
| SI-GATE-FR-294 | Prehod mora podpirati nadgradnjo dostopne točke eDelivery (npr. na Domibus 2.x) brez spremembe vmesnikov #1 … | Praga, Q&A DG MOVE (vpr. 14) | M | ED, OP | A | 7 |
