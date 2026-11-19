# 6 Funkcionalne zahteve iz IU 2024/1942

> **Zahteva:** zahteve, ki jih za eFTI-vrata predpisuje Izvedbena uredba (EU) 2024/1942
>
> **Viri:** IU 2024/1942 (UL L, 2024/1942, 20. 12. 2024, slovenska jezikovna različica; popravek 32024R1942R(01) z dne 27. 4. 2026 se nanaša le na bolgarsko različico); NL PvE pogl. 2 in 9.1
>
> **Status:** osnutek v0.2 (19. 11. 2026), za interni pregled

## 6.0 Način zapisa

To poglavje prenaša obveznosti iz IU 2024/1942 v preverljive zahteve za izvajalca ločenega javnega naročila. Besedilo zahtev sledi uradnemu slovenskemu besedilu uredbe; kjer je zahteva preoblikovana, je vsebina nespremenjena, vir pa naveden do točke člena. Podrobnejše zahteve iz tehničnih smernic (TGD) in ICD so v poglavju 7, nefunkcionalne v poglavju 8.

**Izrazi.** Zahteve uporabljajo izraze iz slovenske različice uredbe: *prehod eFTI* (v tej TS tudi »eFTI-vrata«), *dostopovna točka organa* (AAP), *register dovoljenj*, *iskalni mehanizem*, *register identifikatorjev*, *uporabniška aplikacija*, *edinstvena elektronska identifikacijska povezava* (UIL), *sporočilo o nadaljnjem ukrepanju*.

**Stolpci.**

| Stolpec | Pomen |
|---|---|
| Oznaka | `SI-GATE-FR-NNN`; številski bloki po členih (čl. 2: 001–009, čl. 3: 010–029, čl. 4: 030–059, čl. 5: 060–069, čl. 6: 070–109, čl. 7: 110–119, čl. 8: 120–129, čl. 9: 130–139, čl. 10: 140–149, čl. 11: 150–169, čl. 12–13: 170–179) |
| Vir | člen, odstavek, točka IU 2024/1942 |
| P | prioriteta: **M** obvezno (pravna obveznost), **P** pogojno (velja, če je izpolnjen pogoj iz zahteve ali če je komponenta v obsegu JN po M2) |
| Komp. | komponenta (element modela C4, Priloga D): **PE** prehod eFTI (`vrata.gateService`), **IM** iskalni mehanizem, **RI** register identifikatorjev (`vrata.gateService.roi`), **ED** dostopna točka eDelivery (`vrata.ap`), **AAP** dostopovna točka organa, **RD** register dovoljenj, **UA** uporabniška aplikacija, **UP** upravljavska aplikacija (`vrata.admin`), **OP** obratovanje |
| Preverjanje | **T** test (avtomatiziran ali ročni, tudi test skladnosti proti referenčni implementaciji), **D** demonstracija, **P** pregled dokumentacije ali konfiguracije, **A** analiza |

**Obseg.** Po čl. 4(4) lahko država članica AAP vzpostavi zunaj prehoda eFTI (v obstoječih sistemih pristojnih organov) ali ga vključi v prehod. Dokler M2 ne izbere variante, so zahteve za AAP, register dovoljenj in uporabniško aplikacijo označene s **P**; po izbiri variante se bodisi prenesejo med obvezne zahteve tega JN bodisi postanejo zahteve za vmesnik do sistemov pristojnih organov.

## 6.1 Skupni ukrepi (čl. 2)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-001 | Sistem mora uradniku pristojnega organa omogočiti dostop do podatkov eFTI z neposredno obdelavo UIL, ki jo gospodarski subjekt sporoči v strojno berljivi obliki (prikaz na zaslonu ali natis, npr. koda QR; po odločitvi organa tudi po e-pošti ali drugi aplikaciji za sporočila). | čl. 2(1)(a) | M | PE, UA | T |
| SI-GATE-FR-002 | Sistem mora omogočiti pridobitev UIL iz registra identifikatorjev na podlagi identifikatorja, povezanega s prevozom, in nato dostop do podatkov eFTI. | čl. 2(1)(b) | M | IM, RI, UA | T |
| SI-GATE-FR-003 | Sistem mora ob vsaki zahtevi za dostop do podatkov eFTI zagotoviti avtentificirano identifikacijo in ustrezno dovoljenje uradnika. | čl. 2(2)(a) | M | AAP, RD | T |
| SI-GATE-FR-004 | Sistem mora posredovati zahteve uradnikov, vključno s pridobivanjem zahtevanih informacij od ustrezne platforme ali platform eFTI preko varnih povezav. | čl. 2(2)(b) | M | PE, ED | T |
| SI-GATE-FR-005 | Rešitev mora vsebovati vsaj komponente: dostopovne točke organov, register dovoljenj, prehod eFTI, iskalni mehanizem in uporabniško aplikacijo; ponudnik v arhitekturnem opisu za vsako komponento navede, ali jo dobavi, ali pa vmesnik do obstoječe komponente pristojnega organa. | čl. 2(3) | M | vse | P |
| SI-GATE-FR-006 | Izvajalec mora zagotoviti vzpostavitev, gostovanje, razvoj, razpoložljivost, spremljanje, posodabljanje in vzdrževanje komponent ter varnost obdelovanih informacij v obsegu, ki ga določa pogodba (razmejitev odgovornosti med MZIE, izvajalcem in pristojnimi organi v pogl. 12 in 13). | čl. 2(4) | M | OP | P |
| SI-GATE-FR-007 | Sistem mora dostop do podatkov eFTI in njihovo obdelavo omejiti na namene preverjanja skladnosti in ga izvajati v skladu s pravili o varstvu osebnih podatkov in zaupnosti poslovnih podatkov; dostop brez veljavnih pravic mora biti zavrnjen in zabeležen. | čl. 2(5) | M | AAP, RD, PE | T, P |

## 6.2 Zahteve za dostop, odgovori in sporočila o nadaljnjem ukrepanju (čl. 3)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-010 | Uradnik mora vse zahteve za dostop vložiti v uporabniški aplikaciji preko dostopovne točke organa; prehod eFTI ne sme sprejemati zahtev pristojnih organov mimo AAP. | čl. 3(1), čl. 4(1) | M | AAP, UA, PE | T |
| SI-GATE-FR-011 | Zahteva za dostop mora vsebovati UIL ali enega ali več identifikatorjev za pridobitev UIL iz registra identifikatorjev. | čl. 3(2)(a) | M | UA, PE | T |
| SI-GATE-FR-012 | Uporabniška aplikacija mora zahtevi samodejno dodati sklice na pravice dostopa uradnika iz registra dovoljenj. | čl. 3(2)(b) | P | UA, RD | T |
| SI-GATE-FR-013 | Zahteva mora vsebovati edinstveno identifikacijsko številko, ki jo izda AAP; uporabniška aplikacija jo doda samodejno. | čl. 3(2)(c) | M | AAP, UA | T |
| SI-GATE-FR-014 | Sistem mora podpirati odgovor s podatki eFTI in metapodatki oziroma identifikatorji sporočil, ki prehodom in AAP omogočajo povezavo odgovora s posamezno zahtevo. | čl. 3(3)(a) | M | PE, AAP | T |
| SI-GATE-FR-015 | Sistem mora podpirati sporočila o napaki s kodirano ali kratko besedilno specifikacijo vrste napake, kadar podatkov ni mogoče dati na razpolago iz tehničnih razlogov ali razlogov poslovnega procesa. | čl. 3(3)(b) | M | PE | T |
| SI-GATE-FR-016 | Prehod eFTI, ki prejme zahtevo z identifikatorji, mora izdati sporočilo, da podatki niso na voljo, kadar iskalni mehanizem v registru identifikatorjev ne najde aktivnih UIL. | čl. 3(3)(c) | M | PE, IM | T |
| SI-GATE-FR-017 | Sistem mora podpirati sporočilo »ni odgovora«, kadar prehod ali platforma potrdi prejem zahteve, a v 60 sekundah od potrditve ne pošlje zahtevanih podatkov (glej tudi SI-GATE-FR-085). | čl. 3(3)(d) | M | PE | T |
| SI-GATE-FR-018 | Uporabniška aplikacija mora uradniku omogočiti vložitev sporočila o nadaljnjem ukrepanju, kadar ugotovi, da so pridobljene informacije nepopolne ali ne izpolnjujejo zahtev. | čl. 3(4) | P | UA | D |
| SI-GATE-FR-019 | Sporočilo o nadaljnjem ukrepanju se mora posredovati preko AAP in vsebovati informacije za gospodarski subjekt (prosto besedilo ali priložen dokument), UIL ter edinstveno identifikacijsko številko izvorne zahteve. | čl. 3(5) | M | AAP, UA, PE | T |

## 6.3 Dostopovna točka organa (čl. 4)

Velja v obsegu, ki ga določi M2 (glej 6.0, »Obseg«).

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-030 | AAP mora biti edina točka dostopa uradnika do okolja za izmenjavo eFTI. | čl. 4(1) | P | AAP | A, T |
| SI-GATE-FR-031 | AAP mora avtentificirati identiteto uradnika ali zagotoviti, da jo avtentificira druga ustrezna komponenta. | čl. 4(2)(a), 4(3)(a) | P | AAP | T |
| SI-GATE-FR-032 | AAP mora zahtevo odobriti na podlagi pravic dostopa iz registra dovoljenj ali jo zavrniti, če uradnik nima registriranih aktivnih pravic. | čl. 4(2)(b) | P | AAP, RD | T |
| SI-GATE-FR-033 | AAP mora vsako odobreno zahtevo registrirati z edinstveno identifikacijsko številko in evidentirati vsaj: identifikacijsko referenco uradnika, UIL ali podane identifikatorje, sklice na pravice dostopa ter datum in čas vložitve. | čl. 4(2)(c) | P | AAP | T |
| SI-GATE-FR-034 | AAP mora odobreno zahtevo poslati prehodu eFTI z edinstveno številko zahteve, UIL ali identifikatorji in sklici na pravice obdelave uradnika. | čl. 4(2)(d) | P | AAP | T |
| SI-GATE-FR-035 | AAP mora odgovore prehoda prejeti in jih preko uporabniške aplikacije dati na voljo odgovornemu uradniku. | čl. 4(2)(e) | P | AAP, UA | T |
| SI-GATE-FR-036 | AAP mora za vsak odgovor voditi revizijsko sled: številka zahteve, datum in čas prejema odgovora, datum in čas posredovanja uradniku. | čl. 4(2)(f) | P | AAP | T |
| SI-GATE-FR-037 | AAP mora arhiv zahtev in dnevnik odgovorov hraniti dve leti ali dlje, če to določajo nacionalni predpisi o razpoložljivosti dokazov; rok hrambe mora biti nastavljiv. | čl. 4(2)(g) | P | AAP | P, T |
| SI-GATE-FR-038 | AAP mora vsako sporočilo o nadaljnjem ukrepanju registrirati z edinstveno številko in evidentirati: referenco uradnika, UIL in številko izvorne zahteve, datum in čas vložitve, vsebino. | čl. 4(2)(h) | P | AAP | T |
| SI-GATE-FR-039 | AAP mora sporočilo o nadaljnjem ukrepanju poslati prehodu eFTI z UIL, številko izvorne zahteve in vsebino sporočila. | čl. 4(2)(i) | P | AAP | T |
| SI-GATE-FR-040 | AAP mora uporabljati sredstva elektronske identifikacije, ki omogočajo zanesljivo identifikacijo in avtentikacijo uradnikov (nacionalni gradniki, npr. SI-PASS, SIGEN-CA; izbira v pogl. 5). | čl. 4(3)(a) | P | AAP | P, T |
| SI-GATE-FR-041 | AAP mora vzpostaviti in ohranjati varno povezavo s prehodom eFTI ter podpirati varno povezavo z uporabniško aplikacijo. | čl. 4(3)(c), 4(3)(d) | M | AAP, PE | T |

## 6.4 Register dovoljenj (čl. 5)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-060 | Register dovoljenj mora za vsakega uradnika hraniti edinstveno identifikacijsko referenco. | čl. 5(a) | P | RD | T |
| SI-GATE-FR-061 | Register dovoljenj mora hraniti pravice dostopa kot seznam sklicev na pravne akte EU in nacionalne pravne akte ter kot seznam identifikatorjev podsklopov podatkov eFTI iz oddelkov 3 in 4 Priloge k DU 2024/2024. | čl. 5(b) | P | RD | T, P |
| SI-GATE-FR-062 | Register dovoljenj mora hraniti pravice obdelave kot kodirane sklice na postopke obdelave za vsak podsklop podatkov eFTI. | čl. 5(c) | P | RD | T |
| SI-GATE-FR-063 | Register dovoljenj mora voditi dnevnik sprememb pravic dostopa in pravic obdelave. | čl. 5(d) | P | RD | T |

## 6.5 Prehod eFTI (čl. 6)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-070 | Prehod eFTI mora neposredno ali preko drugih prehodov zagotoviti, da se odobrene zahteve z zahtevanimi informacijami posredujejo platformi eFTI. | čl. 6(1)(a) | M | PE, ED | T |
| SI-GATE-FR-071 | Prehod eFTI mora odgovor platforme posredovati uporabniški aplikaciji odgovornega uradnika, neposredno ali preko AAP. | čl. 6(1)(b) | M | PE | T |
| SI-GATE-FR-072 | Prehod eFTI mora sporočilo o nadaljnjem ukrepanju posredovati platformi eFTI, ki hrani podatke izvorne zahteve. | čl. 6(1)(c) | M | PE, ED | T |
| SI-GATE-FR-073 | Kot »prehod, ki zahteva dostop«, pri AAP kot ločeni komponenti, mora prehod potrditi zahtevo ali sporočilo o nadaljnjem ukrepanju s preverjanjem varnostnega ključa AAP. | čl. 6(2)(a)(i) | P | PE | T |
| SI-GATE-FR-074 | Kot »prehod, ki prejme zahtevo« mora prehod potrditi zahtevo ali sporočilo o nadaljnjem ukrepanju s preverjanjem varnostnega ključa pošiljateljevega prehoda eFTI. | čl. 6(2)(a)(ii) | M | PE, ED | T |
| SI-GATE-FR-075 | Če preverjanje ključa ni uspešno, mora prehod poslati sporočilo o napaki prehodu, ki zahteva dostop, AAP ali uradniku, kot je ustrezno. | čl. 6(2)(a)(iii) | M | PE | T |
| SI-GATE-FR-076 | Prehod mora zahtevo ali sporočilo o nadaljnjem ukrepanju obdelati z iskalnim mehanizmom in ga posredovati: kot prehod, ki zahteva dostop, ustrezni platformi ali prehodom; kot prehod, ki prejme zahtevo, ustrezni platformi. | čl. 6(2)(b) | M | PE, IM | T |
| SI-GATE-FR-077 | Prehod mora za vsako obdelano zahtevo ali sporočilo o nadaljnjem ukrepanju voditi revizijsko sled vsaj z: edinstveno številko zahteve ali sporočila, identifikatorjem AAP ali prehoda pošiljatelja, datumom in časom prejema. | čl. 6(2)(c) | M | PE | T |
| SI-GATE-FR-078 | Ob odgovoru neposredno od platforme mora prehod preveriti varnostni ključ **in certifikacijski status** platforme na podlagi registra platform (SI-GATE-FR-093). | čl. 6(2)(d)(i) | M | PE | T |
| SI-GATE-FR-079 | Ob odgovoru od prehoda, ki prejme zahtevo, mora prehod preveriti njegov varnostni ključ na podlagi registra prehodov (SI-GATE-FR-092). | čl. 6(2)(d)(ii) | M | PE, ED | T |
| SI-GATE-FR-080 | Če preverjanje ključa ali certifikacijskega statusa ni uspešno, mora prehod poslati ustrezno sporočilo o napaki prehodu, ki zahteva dostop, AAP ali uporabniški aplikaciji. | čl. 6(2)(d)(iii) | M | PE | T |
| SI-GATE-FR-081 | Prehod mora odgovor posredovati po isti poti v obratnem zaporedju: prehodu, ki zahteva dostop, ali uporabniški aplikaciji (neposredno ali preko AAP). | čl. 6(2)(e) | M | PE | T |
| SI-GATE-FR-085 | Če je prejeta potrditev prejema zahteve, drug odgovor pa ne v 60 sekundah od potrditve, mora prehod poslati sporočilo »ni odgovora« prehodu, ki zahteva dostop, AAP ali uporabniški aplikaciji. | čl. 6(2)(f) | M | PE | T |
| SI-GATE-FR-086 | Prehod mora za vsak posredovani odgovor voditi revizijsko sled vsaj z: UIL prejetega sklopa podatkov, edinstveno številko platforme ali prehoda, od katerega je prejel odgovor, datumom in časom prejema ter navedbo, če odgovor ni bil prejet. | čl. 6(2)(g) | M | PE | T |
| SI-GATE-FR-087 | Prehod mora evidence iz SI-GATE-FR-077 in SI-GATE-FR-086 arhivirati in hraniti za revizijo dve leti ali dlje, če to določajo nacionalni predpisi; rok mora biti nastavljiv. | čl. 6(2)(h) | M | PE, OP | P, T |
| SI-GATE-FR-090 | Prehod mora vzpostaviti in ohranjati varno povezavo z AAP slovenskih pristojnih organov. | čl. 6(3)(b) | M | PE | T |
| SI-GATE-FR-091 | Kadar so AAP integrirane v prehod, mora prehod vzpostaviti in ohranjati varno povezavo z uporabniškimi aplikacijami uradnikov; kadar so AAP ločene, mora voditi register z edinstvenimi številkami in varnostnimi certifikati AAP. | čl. 6(3)(c), 6(3)(d) | M | PE, UP | T, D |
| SI-GATE-FR-092 | Prehod mora vzpostaviti in ohranjati varno povezavo z vsemi drugimi prehodi eFTI in posodobljen register z njihovimi edinstvenimi številkami in varnostnimi certifikati. | čl. 6(3)(e) | M | PE, ED, UP | T, D |
| SI-GATE-FR-093 | Prehod mora vzpostaviti in ohranjati varno povezavo z vsemi platformami eFTI, certificiranimi v Sloveniji, in posodobljen register z njihovimi edinstvenimi številkami, varnostnimi ključi in certifikacijskim statusom. | čl. 6(3)(f) | M | PE, ED, UP | T, D |
| SI-GATE-FR-094 | Prehod mora omogočati uporabo splošno opredeljenih storitev in ključnih elementov (konfiguracija, kode napak, taksonomije, šifranti), dogovorjenih v mreži za operativno podporo, in jih posodabljati brez spremembe programske kode, kjer je to mogoče. | čl. 6(3)(g) | M | PE | P, D |
| SI-GATE-FR-095 | Dokler v Sloveniji noben organ za ugotavljanje skladnosti ni akreditiran za certifikacijo platform, mora prehod na zahtevo upravljavca platforme vzpostaviti povezavo in vnos v register platform tudi za platforme, certificirane v drugi državi članici, po potrditvi te države, da ni prejela enake zahteve od druge države članice; postopek mora biti podprt v upravljavski aplikaciji. | čl. 6(4) | M | PE, UP, OP | D, P |

## 6.6 Uporabniška aplikacija (čl. 7)

Velja v obsegu, ki ga določi M2 (glej 6.0, »Obseg«).

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-110 | Uporabniška aplikacija mora ustvariti zahtevo na podlagi informacij uradnika, potem ko AAP uradnika identificira, avtentificira in odobri. | čl. 7(2)(a) | P | UA | T |
| SI-GATE-FR-111 | Uporabniška aplikacija mora prejeti podatke eFTI, sporočilo »ni odgovora« ali sporočilo o napaki in jih prikazati odgovornemu uradniku. | čl. 7(2)(b) | P | UA | T, D |
| SI-GATE-FR-112 | Uporabniška aplikacija mora omogočiti druge postopke obdelave prejetih podatkov v skladu s pravicami obdelave uradnika. | čl. 7(2)(c) | P | UA | T |
| SI-GATE-FR-113 | Kadar nacionalni predpisi to omogočajo, mora uporabniška aplikacija ustvariti sporočila o nadaljnjem ukrepanju. | čl. 7(2)(d) | P | UA | D |
| SI-GATE-FR-114 | Uporabniška aplikacija mora zagotavljati grafični uporabniški vmesnik, varno povezavo z AAP ali prehodom in pri obdelavi uporabljati podsklope podatkov iz DU 2024/2024 v pristojnosti uradnika. | čl. 7(3) | P | UA | D, T |

## 6.7 Iskalni mehanizem (čl. 8)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-120 | Iskalni mehanizem mora biti vgrajen v prehod eFTI. | čl. 8(1) | M | IM | P |
| SI-GATE-FR-121 | Iskalni mehanizem mora iz UIL pridobiti identifikator platforme, ki hrani podatke, oziroma identifikator prehoda, s katerim je platforma povezana. | čl. 8(1)(a) | M | IM | T |
| SI-GATE-FR-122 | Če zahteva vsebuje identifikatorje iz čl. 11(3), mora iskalni mehanizem iskati v registru identifikatorjev; ob zadetku pridobiti aktivno UIL ali niz UIL in jih obdelati po SI-GATE-FR-121; brez zadetka o tem obvestiti prehod. | čl. 8(1)(b) | M | IM, RI | T |
| SI-GATE-FR-123 | Iskalni mehanizem mora upravljati register identifikatorjev v skladu s čl. 11. | čl. 8(2)(a) | M | IM, RI | T |
| SI-GATE-FR-124 | Iskalni mehanizem mora za odkrivanje platform uporabljati SMP in SML v skladu s specifikacijami eDelivery ali storitev registra s podobnimi zmogljivostmi. | čl. 8(2)(b) | M | IM, ED | T |

## 6.8 Izmenjava sporočil (čl. 9)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-130 | Prehod, AAP in uporabniška aplikacija morajo komunicirati v standardizirani obliki za izmenjavo sporočil. | čl. 9(1) | M | PE, AAP, UA | P, T |
| SI-GATE-FR-131 | Komunikacija med prehodi ter med prehodom in platformami mora potekati v obliki XML (veljavna verzija sheme XSD po pogl. 7). | čl. 9(1) | M | PE, ED | T |
| SI-GATE-FR-132 | Vsa komunikacija med prehodi mora potekati preko dostopovnih točk eDelivery po specifikacijah za izmenjavo sporočil eDelivery in s statičnim iskanjem. | čl. 9(2) | M | ED | T |
| SI-GATE-FR-133 | Za komunikacijo med prehodom in platformami mora biti omogočena izmenjava preko dostopovnih točk eDelivery z dinamičnim iskanjem. | čl. 9(3) | M | ED | T |
| SI-GATE-FR-134 | Če MZIE odloči, da poleg eDelivery dovoli tudi enakovredne nacionalno opredeljene specifikacije za komunikacijo s platformami (npr. profil REST), morajo biti te specifikacije podrobne, posodobljene in javno dostopne. Odločitev: odprto (pogl. 5, ICD P-02). | čl. 9(4) | P | PE, OP | P |

## 6.9 Varnostni certifikati (čl. 10)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-140 | Dostopni točki eDelivery prehoda in dostopnim točkam platform, certificiranih v Sloveniji, se morajo izdati varnostni certifikati preko certifikacijskega organa. Kateri certifikacijski organ (npr. SIGEN-CA) jih izdaja, je odprto vprašanje za MZIE (pogl. 5.4). | čl. 10(1) | M | ED, OP | P |
| SI-GATE-FR-141 | Zasebni ključi dostopne točke eDelivery prehoda morajo biti varno shranjeni (npr. HSM ali enakovredna rešitev, pogl. 8.5); digitalni certifikati se morajo med prehodi ter med prehodom in platformami prenašati na varen način. | čl. 10(2) | M | ED, OP | P, A |
| SI-GATE-FR-142 | Rešitev mora zagotavljati varne mehanizme za prejemanje, evidentiranje, pridobivanje in potrjevanje javnih ključev ali certifikatov povezanih platform; za ta namen se lahko uporabi register SMP z ustreznimi varnostnimi mehanizmi. | čl. 10(3) | M | UP, ED | D, T |

## 6.10 Register identifikatorjev (čl. 11)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-150 | Register identifikatorjev mora platformam omogočiti nalaganje UIL skupaj z identifikatorji ter nalaganje, aktivacijo, deaktivacijo in izbris UIL in identifikatorjev. | čl. 11(1) | M | RI | T |
| SI-GATE-FR-151 | Prehod mora iz UIL razbrati identifikator prehoda, identifikator platforme in UUID sklopa podatkov, ki ga dodeli platforma. | čl. 11(2) | M | IM, RI | T |
| SI-GATE-FR-152 | Prehod mora imeti identifikator, ki omogoča enoznačno odkrivanje v okolju eFTI (dogovor o poimenovanju: ICD v0.5, P-22; odprto). | čl. 11(2)(a) | M | PE, OP | P |
| SI-GATE-FR-153 | Register identifikatorjev mora podpirati vsaj identifikatorje eFTI39, eFTI188, eFTI374, eFTI378, eFTI448, eFTI581, eFTI578, eFTI618, eFTI620, eFTI987, eFTI1000 in eFTI1451 (prevoz nevarnega blaga – oznaka). | čl. 11(3) | M | RI | T |
| SI-GATE-FR-154 | Register identifikatorjev mora UIL aktivirati in dati na voljo za poizvedbe takoj po nalaganju ter jo deaktivirati, ko je naložen identifikator eFTI188. | čl. 11(4) | M | RI | T |
| SI-GATE-FR-155 | Za UIL, pri katerih ima eFTI581 vrednost »3« (cestni prevoz), mora register UIL deaktivirati šele po izteku obdobja iz čl. 8(2) Uredbe (ES) št. 1072/2009; obdobje mora biti nastavljivo. | čl. 11(4) | M | RI | T |
| SI-GATE-FR-156 | Po deaktivaciji mora register UIL in z njo povezane identifikatorje izbrisati. | čl. 11(4) | M | RI | T |

## 6.11 Mreža za tehnično in operativno podporo (čl. 12–13)

Organizacijske zahteve so v pogl. 13; tu so le zahteve, ki vplivajo na rešitev.

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-170 | Rešitev mora podpirati službo za pomoč uporabnikom na prvi ravni (za uradnike) in na drugi ravni (za službe prve ravni pristojnih organov in platform); delitev vlog med MZIE, izvajalcem in organi določi pogl. 13. | čl. 12(1) | M | OP | P |
| SI-GATE-FR-171 | Službe za pomoč morajo biti na voljo ob delavnikih vsaj med 10.00 in 16.00 (CET/CEST), razen ob praznikih; ob koncih tedna in praznikih mora biti na voljo dežurstvo za nujne zadeve. | čl. 12(4) | M | OP | P |
| SI-GATE-FR-172 | Služba za pomoč mora uporabljati orodje, ki omogoča enotno identifikacijo vsake prošnje in nadaljnje ukrepanje, tudi med službami različnih ravni (izmenjava zahtevkov po TG1.3 eFTI governance). | čl. 12(5) | M | OP | D |
| SI-GATE-FR-173 | Služba za pomoč mora voditi dnevnike vseh prošenj in njihove zgodovine ter redno poročati o dejavnostih. | čl. 12(6) | M | OP | P |
| SI-GATE-FR-174 | Službe za pomoč morajo biti na voljo od datuma iz čl. 5(1) Uredbe (EU) 2020/1056. | čl. 12(8) | M | OP | P |
| SI-GATE-FR-175 | Izvajalec mora nacionalni kontaktni točki eFTI (čl. 13(2)) zagotavljati podatke o stanju delovanja slovenskih eFTI-vrat. | čl. 13(3)(a) | M | OP | P |

## 6.12 Odprta vprašanja za MZIE

1. **Obseg AAP, registra dovoljenj in uporabniške aplikacije** v ločenem JN (čl. 4(4)); odloči M2.
2. **Certifikacijski organ** za varnostne certifikate dostopnih točk eDelivery (čl. 10(1)).
3. **Nacionalni profil REST** za komunikacijo s platformami (čl. 9(4)).
4. **Čl. 6(4)**: Slovenska akreditacija po implementacijskem načrtu (20. 5. 2026) še ne more akreditirati organov za ugotavljanje skladnosti, zato bo postopek priklopa platform, certificiranih v drugih DČ, verjetno potreben že ob zagonu.
5. **Spremembe IU 2024/1942**: TGD v1.0.1 (tabela 4) napoveduje razširitev seznama identifikatorjev iz čl. 11(3); obravnava v SI-GATE-FR-213.
