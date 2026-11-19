# 6 Funkcionalne zahteve iz IU 2024/1942

> **Zahteva:** zahteve, ki jih za eFTI Gate predpisuje Izvedbena uredba (EU) 2024/1942
>
> **Viri:** IU 2024/1942 (UL L, 2024/1942, 20. 12. 2024, slovenska jezikovna različica; popravek 32024R1942R(01) z dne 27. 4. 2026 se nanaša le na bolgarsko različico); NL PvE pogl. 2 in 9.1
>
> **Status:** osnutek v0.2 (19. 11. 2026), za interni pregled

## 6.0 Način zapisa

To poglavje prenaša obveznosti iz IU 2024/1942 v preverljive zahteve za izvajalca ločenega javnega naročila. Besedilo zahtev sledi uradnemu slovenskemu besedilu uredbe; kjer je zahteva preoblikovana, je vsebina nespremenjena, vir pa naveden do točke člena. Podrobnejše zahteve iz tehničnih smernic (TGD) in ICD so v poglavju 7, nefunkcionalne v poglavju 8.

**Izrazi.** TS uporablja dogovorjene izraze eFTI v angleščini, kot jih uporabljajo tehnične smernice (TGD), ICD in skupnost eFTI (npr. *eFTI Gate*, *eFTI Platform*, *AAP*, *UAP*, *Authorisation Registry*, *Registry of Identifiers*, *search mechanism*, *UIL*, *eFTI data request*, *follow-up communication*, *eFTI dataset*, *eFTI data subset*, *requesting* in *receiving eFTI Gate*). Angleški izrazi se ne sklanjajo. Ustrezni izrazi iz slovenske različice IU 2024/1942 in razlage so v Prilogi B. Splošni pravni izrazi (pristojni organ, uradnik pristojnega organa, gospodarski subjekt) ostanejo slovenski.

**Stolpci.**

| Stolpec | Pomen |
|---|---|
| Oznaka | `SI-GATE-FR-NNN`; številski bloki po členih (čl. 2: 001–009, čl. 3: 010–029, čl. 4: 030–059, čl. 5: 060–069, čl. 6: 070–109, čl. 7: 110–119, čl. 8: 120–129, čl. 9: 130–139, čl. 10: 140–149, čl. 11: 150–169, čl. 12–13: 170–179) |
| Vir | člen, odstavek, točka IU 2024/1942 |
| P | prioriteta: **M** obvezno (pravna obveznost), **P** pogojno (velja, če je izpolnjen pogoj iz zahteve ali če je komponenta v obsegu JN po M2) |
| Komp. | komponenta (element modela C4, Priloga D): **EG** eFTI Gate (`gate.gateService`), **SM** search mechanism (`gate.gateService.searchMechanism`), **RoI** Registry of Identifiers (`gate.gateService.roi`), **ED** eDelivery Access Point (`gate.ap`), **AAP** Authority Access Point, **AR** Authorisation Registry, **UAP** User Application, **UP** upravljavska aplikacija (`gate.adminApp`), **OP** obratovanje in organizacija (ni elementa modela), **TCT** okolje TCT za eFTI Platform (`gate.tct`) |
| Preverjanje | **T** test (avtomatiziran ali ročni, tudi test skladnosti proti referenčni implementaciji), **D** demonstracija, **P** pregled dokumentacije ali konfiguracije, **A** analiza |

**Obseg.** Po čl. 4(4) lahko država članica AAP vzpostavi zunaj eFTI Gate (v obstoječih sistemih pristojnih organov) ali ga vključi v eFTI Gate. Dokler M2 ne izbere variante, so zahteve, ki veljajo **izključno** za AAP, Authorisation Registry ali UAP, označene s **P**; zahteve, ki vključujejo tudi eFTI Gate (EG, SM, RoI, ED), ostanejo **M**; po izbiri variante se bodisi prenesejo med obvezne zahteve tega JN bodisi postanejo zahteve za vmesnik do sistemov pristojnih organov.

## 6.1 Skupni ukrepi (čl. 2)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-001 | Sistem mora uradniku pristojnega organa omogočiti dostop do podatkov eFTI z neposredno obdelavo UIL, ki jo gospodarski subjekt sporoči v strojno berljivi obliki (prikaz na zaslonu ali natis, npr. koda QR; po odločitvi organa tudi po e-pošti ali drugi aplikaciji za sporočila). | čl. 2(1)(a) | M | EG, UAP | T |
| SI-GATE-FR-002 | Sistem mora omogočiti pridobitev UIL iz Registry of Identifiers na podlagi identifikatorja, povezanega s prevozom, in nato dostop do podatkov eFTI. | čl. 2(1)(b) | M | SM, RoI, UAP | T |
| SI-GATE-FR-003 | Sistem mora ob vsaki eFTI data request zagotoviti avtentificirano identifikacijo in ustrezno dovoljenje uradnika. | čl. 2(2)(a) | P | AAP, AR | T |
| SI-GATE-FR-004 | Sistem mora posredovati zahteve uradnikov, vključno s pridobivanjem zahtevanih informacij od ustrezne eFTI Platform ali eFTI Platform preko varnih povezav. | čl. 2(2)(b) | M | EG, ED | T |
| SI-GATE-FR-005 | Rešitev mora vsebovati vsaj komponente: AAP, Authorisation Registry, eFTI Gate, search mechanism in UAP; ponudnik v arhitekturnem opisu za vsako komponento navede, ali jo dobavi, ali pa vmesnik do obstoječe komponente pristojnega organa. | čl. 2(3) | M | vse | P |
| SI-GATE-FR-006 | Izvajalec mora zagotoviti vzpostavitev, gostovanje, razvoj, razpoložljivost, spremljanje, posodabljanje in vzdrževanje komponent ter varnost obdelovanih informacij v obsegu, ki ga določa pogodba (razmejitev odgovornosti med MZIE, izvajalcem in pristojnimi organi bo določena v pogl. 12 in 13, v pripravi). | čl. 2(4) | M | OP | P |
| SI-GATE-FR-007 | Sistem mora dostop do podatkov eFTI in njihovo obdelavo omejiti na namene preverjanja skladnosti in ga izvajati v skladu s pravili o varstvu osebnih podatkov in zaupnosti poslovnih podatkov; dostop brez veljavnih pravic mora biti zavrnjen in zabeležen. | čl. 2(5) | M | AAP, AR, EG | T, P |

## 6.2 Zahteve za dostop, odgovori in follow-up communication (čl. 3)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-010 | Uradnik mora vse zahteve za dostop vložiti v UAP preko AAP; eFTI Gate ne sme sprejemati zahtev pristojnih organov mimo AAP. | čl. 3(1), čl. 4(1) | M | AAP, UAP, EG | T |
| SI-GATE-FR-011 | Zahteva za dostop mora vsebovati UIL ali enega ali več identifikatorjev za pridobitev UIL iz Registry of Identifiers. | čl. 3(2)(a) | M | UAP, EG | T |
| SI-GATE-FR-012 | UAP mora zahtevi samodejno dodati sklice na pravice dostopa uradnika iz Authorisation Registry. | čl. 3(2)(b) | P | UAP, AR | T |
| SI-GATE-FR-013 | Zahteva mora vsebovati edinstveno identifikacijsko številko, ki jo izda AAP; UAP jo doda samodejno. | čl. 3(2)(c) | P | AAP, UAP | T |
| SI-GATE-FR-014 | Sistem mora podpirati odgovor s podatki eFTI in metapodatki oziroma identifikatorji sporočil, ki eFTI Gate in AAP omogočajo povezavo odgovora s posamezno zahtevo. | čl. 3(3)(a) | M | EG, AAP | T |
| SI-GATE-FR-015 | Sistem mora podpirati sporočila o napaki s kodirano ali kratko besedilno specifikacijo vrste napake, kadar podatkov ni mogoče dati na razpolago iz tehničnih razlogov ali razlogov poslovnega procesa. | čl. 3(3)(b) | M | EG | T |
| SI-GATE-FR-016 | receiving eFTI Gate z identifikatorji, mora izdati sporočilo, da podatki niso na voljo, kadar search mechanism v Registry of Identifiers ne najde aktivnih UIL. | čl. 3(3)(c) | M | EG, SM | T |
| SI-GATE-FR-017 | Sistem mora podpirati sporočilo »ni odgovora«, kadar eFTI Gate ali eFTI Platform potrdi prejem zahteve, a v 60 sekundah od potrditve ne pošlje zahtevanih podatkov (glej tudi SI-GATE-FR-085). | čl. 3(3)(d) | M | EG | T |
| SI-GATE-FR-018 | UAP mora uradniku omogočiti vložitev follow-up communication, kadar ugotovi, da so pridobljene informacije nepopolne ali ne izpolnjujejo zahtev. | čl. 3(4) | P | UAP | D |
| SI-GATE-FR-019 | follow-up communication se mora posredovati preko AAP in vsebovati informacije za gospodarski subjekt (prosto besedilo ali priložen dokument), UIL ter edinstveno identifikacijsko številko izvorne zahteve. | čl. 3(5) | M | AAP, UAP, EG | T |

## 6.3 AAP (čl. 4)

Velja v obsegu, ki ga določi M2 (glej 6.0, »Obseg«).

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-030 | AAP mora biti edina točka dostopa uradnika do okolja za izmenjavo eFTI. | čl. 4(1) | P | AAP | A, T |
| SI-GATE-FR-031 | AAP mora avtentificirati identiteto uradnika ali zagotoviti, da jo avtentificira druga ustrezna komponenta. | čl. 4(2)(a), 4(3)(a) | P | AAP | T |
| SI-GATE-FR-032 | AAP mora zahtevo odobriti na podlagi pravic dostopa iz Authorisation Registry ali jo zavrniti, če uradnik nima registriranih aktivnih pravic. | čl. 4(2)(b) | P | AAP, AR | T |
| SI-GATE-FR-033 | AAP mora vsako odobreno zahtevo registrirati z edinstveno identifikacijsko številko in evidentirati vsaj: identifikacijsko referenco uradnika, UIL ali podane identifikatorje, sklice na pravice dostopa ter datum in čas vložitve. | čl. 4(2)(c) | P | AAP | T |
| SI-GATE-FR-034 | AAP mora odobreno zahtevo poslati eFTI Gate z edinstveno številko zahteve, UIL ali identifikatorji in sklici na pravice obdelave uradnika. | čl. 4(2)(d) | P | AAP | T |
| SI-GATE-FR-035 | AAP mora odgovore eFTI Gate prejeti in jih preko UAP dati na voljo odgovornemu uradniku. | čl. 4(2)(e) | P | AAP, UAP | T |
| SI-GATE-FR-036 | AAP mora za vsak odgovor voditi revizijsko sled: številka zahteve, datum in čas prejema odgovora, datum in čas posredovanja uradniku. | čl. 4(2)(f) | P | AAP | T |
| SI-GATE-FR-037 | AAP mora arhiv zahtev in dnevnik odgovorov hraniti dve leti ali dlje, če to določajo nacionalni predpisi o razpoložljivosti dokazov; rok hrambe mora biti nastavljiv. | čl. 4(2)(g) | P | AAP | P, T |
| SI-GATE-FR-038 | AAP mora vsako follow-up communication registrirati z edinstveno številko in evidentirati: referenco uradnika, UIL in številko izvorne zahteve, datum in čas vložitve, vsebino. | čl. 4(2)(h) | P | AAP | T |
| SI-GATE-FR-039 | AAP mora follow-up communication poslati eFTI Gate z UIL, številko izvorne zahteve in vsebino sporočila. | čl. 4(2)(i) | P | AAP | T |
| SI-GATE-FR-040 | AAP mora uporabljati sredstva elektronske identifikacije, ki omogočajo zanesljivo identifikacijo in avtentikacijo uradnikov (nacionalni gradniki, npr. SI-PASS, SIGEN-CA; izbira v pogl. 5). | čl. 4(3)(a) | P | AAP | P, T |
| SI-GATE-FR-041 | AAP mora vzpostaviti in ohranjati varno povezavo z eFTI Gate ter podpirati varno povezavo z UAP. | čl. 4(3)(c), 4(3)(d) | M | AAP, EG | T |

## 6.4 Authorisation Registry (čl. 5)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-060 | Authorisation Registry mora za vsakega uradnika hraniti edinstveno identifikacijsko referenco. | čl. 5(a) | P | AR | T |
| SI-GATE-FR-061 | Authorisation Registry mora hraniti pravice dostopa kot seznam sklicev na pravne akte EU in nacionalne pravne akte ter kot seznam identifikatorjev eFTI data subset iz oddelkov 3 in 4 Priloge k DU 2024/2024. | čl. 5(b) | P | AR | T, P |
| SI-GATE-FR-062 | Authorisation Registry mora hraniti pravice obdelave kot kodirane sklice na postopke obdelave za vsak eFTI data subset. | čl. 5(c) | P | AR | T |
| SI-GATE-FR-063 | Authorisation Registry mora voditi dnevnik sprememb pravic dostopa in pravic obdelave. | čl. 5(d) | P | AR | T |

## 6.5 eFTI Gate (čl. 6)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-070 | eFTI Gate mora neposredno ali preko drugih eFTI Gate zagotoviti, da se odobrene zahteve z zahtevanimi informacijami posredujejo eFTI Platform. | čl. 6(1)(a) | M | EG, ED | T |
| SI-GATE-FR-071 | eFTI Gate mora odgovor eFTI Platform posredovati UAP odgovornega uradnika, neposredno ali preko AAP. | čl. 6(1)(b) | M | EG | T |
| SI-GATE-FR-072 | eFTI Gate mora follow-up communication posredovati eFTI Platform, ki hrani podatke izvorne zahteve. | čl. 6(1)(c) | M | EG, ED | T |
| SI-GATE-FR-073 | Kot requesting eFTI Gate, pri AAP kot ločeni komponenti, mora eFTI Gate potrditi zahtevo ali follow-up communication s preverjanjem varnostnega ključa AAP. | čl. 6(2)(a)(i) | P | EG | T |
| SI-GATE-FR-074 | Kot receiving eFTI Gate mora eFTI Gate potrditi zahtevo ali follow-up communication s preverjanjem varnostnega ključa pošiljateljevega eFTI Gate. | čl. 6(2)(a)(ii) | M | EG, ED | T |
| SI-GATE-FR-075 | Če preverjanje ključa ni uspešno, mora eFTI Gate poslati sporočilo o napaki requesting eFTI Gate, AAP ali uradniku, kot je ustrezno. | čl. 6(2)(a)(iii) | M | EG | T |
| SI-GATE-FR-076 | eFTI Gate mora zahtevo ali follow-up communication obdelati z search mechanism in ga posredovati: kot requesting eFTI Gate, ustrezni eFTI Platform ali eFTI Gate; kot receiving eFTI Gate, ustrezni eFTI Platform. | čl. 6(2)(b) | M | EG, SM | T |
| SI-GATE-FR-077 | eFTI Gate mora za vsako obdelano zahtevo ali follow-up communication voditi revizijsko sled vsaj z: edinstveno številko zahteve ali sporočila, identifikatorjem AAP ali eFTI Gate pošiljatelja, datumom in časom prejema. | čl. 6(2)(c) | M | EG | T |
| SI-GATE-FR-078 | Ob odgovoru neposredno od eFTI Platform mora eFTI Gate preveriti varnostni ključ **in certifikacijski status** eFTI Platform na podlagi Registry of eFTI Platforms (SI-GATE-FR-093). | čl. 6(2)(d)(i) | M | EG | T |
| SI-GATE-FR-079 | Ob odgovoru od receiving eFTI Gate mora eFTI Gate preveriti njegov varnostni ključ na podlagi registra eFTI Gate drugih DČ (SI-GATE-FR-092). | čl. 6(2)(d)(ii) | M | EG, ED | T |
| SI-GATE-FR-080 | Če preverjanje ključa ali certifikacijskega statusa ni uspešno, mora eFTI Gate poslati ustrezno sporočilo o napaki requesting eFTI Gate, AAP ali UAP. | čl. 6(2)(d)(iii) | M | EG | T |
| SI-GATE-FR-081 | eFTI Gate mora odgovor posredovati po isti poti v obratnem zaporedju: requesting eFTI Gate ali UAP (neposredno ali preko AAP). | čl. 6(2)(e) | M | EG | T |
| SI-GATE-FR-085 | Če je prejeta potrditev prejema zahteve (od eFTI Platform ali receiving eFTI Gate), drug odgovor pa ne v 60 sekundah od te potrditve, mora eFTI Gate poslati sporočilo »ni odgovora« requesting eFTI Gate, AAP ali UAP. | čl. 6(2)(f) | M | EG | T |
| SI-GATE-FR-086 | eFTI Gate mora za vsak posredovani odgovor voditi revizijsko sled vsaj z: UIL prejetega eFTI dataset, edinstveno številko eFTI Platform ali eFTI Gate, od katerega je prejel odgovor, datumom in časom prejema ter navedbo, če odgovor ni bil prejet. | čl. 6(2)(g) | M | EG | T |
| SI-GATE-FR-087 | eFTI Gate mora evidence iz SI-GATE-FR-077 in SI-GATE-FR-086 arhivirati in hraniti za revizijo dve leti ali dlje, če to določajo nacionalni predpisi; rok mora biti nastavljiv. | čl. 6(2)(h) | M | EG, OP | P, T |
| SI-GATE-FR-090 | eFTI Gate mora vzpostaviti in ohranjati varno povezavo z AAP slovenskih pristojnih organov. | čl. 6(3)(b) | M | EG | T |
| SI-GATE-FR-091 | Kadar so AAP integrirane v eFTI Gate, mora eFTI Gate vzpostaviti in ohranjati varno povezavo z UAP uradnikov; kadar so AAP ločene, mora voditi register z edinstvenimi številkami in varnostnimi certifikati AAP. | čl. 6(3)(c), 6(3)(d) | M | EG, UP | T, D |
| SI-GATE-FR-092 | eFTI Gate mora vzpostaviti in ohranjati varno povezavo z vsemi drugimi eFTI Gate in posodobljen register z njihovimi edinstvenimi številkami in varnostnimi certifikati. | čl. 6(3)(e) | M | EG, ED, UP | T, D |
| SI-GATE-FR-093 | eFTI Gate mora vzpostaviti in ohranjati varno povezavo z vsemi eFTI Platform, certificiranimi v Sloveniji, in posodobljen register z njihovimi edinstvenimi številkami, varnostnimi ključi in certifikacijskim statusom. | čl. 6(3)(f) | M | EG, ED, UP | T, D |
| SI-GATE-FR-094 | eFTI Gate mora omogočati uporabo splošno opredeljenih storitev in ključnih elementov (konfiguracija, kode napak, taksonomije, šifranti), dogovorjenih v mreži za operativno podporo, in jih posodabljati brez spremembe programske kode (s konfiguracijo ali v upravljavski aplikaciji, SI-GATE-FR-275). | čl. 6(3)(g) | M | EG | P, D |
| SI-GATE-FR-095 | Dokler v Sloveniji noben organ za ugotavljanje skladnosti ni akreditiran za certifikacijo eFTI Platform, mora eFTI Gate na zahtevo upravljavca eFTI Platform vzpostaviti povezavo in vnos v Registry of eFTI Platforms tudi za eFTI Platform, certificirane v drugi državi članici, po potrditvi te države, da ni prejela enake zahteve od druge države članice; postopek mora biti podprt v upravljavski aplikaciji. | čl. 6(4) | M | EG, UP, OP | D, P |

## 6.6 UAP (čl. 7)

Velja v obsegu, ki ga določi M2 (glej 6.0, »Obseg«).

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-110 | UAP mora ustvariti zahtevo na podlagi informacij uradnika, potem ko AAP uradnika identificira, avtentificira in odobri. | čl. 7(2)(a) | P | UAP | T |
| SI-GATE-FR-111 | UAP mora prejeti podatke eFTI, sporočilo »ni odgovora« ali sporočilo o napaki in jih prikazati odgovornemu uradniku. | čl. 7(2)(b) | P | UAP | T, D |
| SI-GATE-FR-112 | UAP mora omogočiti druge postopke obdelave prejetih podatkov v skladu s pravicami obdelave uradnika. | čl. 7(2)(c) | P | UAP | T |
| SI-GATE-FR-113 | Kadar nacionalni predpisi to omogočajo, mora UAP ustvariti follow-up communication. | čl. 7(2)(d) | P | UAP | D |
| SI-GATE-FR-114 | UAP mora zagotavljati grafični uporabniški vmesnik, varno povezavo z AAP ali eFTI Gate in pri obdelavi uporabljati eFTI data subset iz DU 2024/2024 v pristojnosti uradnika. | čl. 7(3) | P | UAP | D, T |

## 6.7 search mechanism (čl. 8)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-120 | search mechanism mora biti vgrajen v eFTI Gate. | čl. 8(1) | M | SM | P |
| SI-GATE-FR-121 | search mechanism mora iz UIL pridobiti identifikator eFTI Platform, ki hrani podatke, oziroma identifikator eFTI Gate, s katerim je eFTI Platform povezana. | čl. 8(1)(a) | M | SM | T |
| SI-GATE-FR-122 | Če zahteva vsebuje identifikatorje iz čl. 11(3), mora search mechanism iskati v Registry of Identifiers; ob zadetku pridobiti aktivno UIL ali niz UIL in jih obdelati po SI-GATE-FR-121; brez zadetka o tem obvestiti eFTI Gate. | čl. 8(1)(b) | M | SM, RoI | T |
| SI-GATE-FR-123 | search mechanism mora upravljati Registry of Identifiers v skladu s čl. 11. | čl. 8(2)(a) | M | SM, RoI | T |
| SI-GATE-FR-124 | search mechanism mora za odkrivanje eFTI Platform uporabljati SMP in SML v skladu s specifikacijami eDelivery ali storitev registra s podobnimi zmogljivostmi. | čl. 8(2)(b) | M | SM, ED | T |

## 6.8 Izmenjava sporočil (čl. 9)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-130 | eFTI Gate, AAP in UAP morajo komunicirati v standardizirani obliki za izmenjavo sporočil. | čl. 9(1) | M | EG, AAP, UAP | P, T |
| SI-GATE-FR-131 | Komunikacija med eFTI Gate ter med eFTI Gate in eFTI Platform mora potekati v obliki XML (veljavna verzija sheme XSD po pogl. 7). | čl. 9(1) | M | EG, ED | T |
| SI-GATE-FR-132 | Vsa komunikacija med eFTI Gate mora potekati preko eDelivery Access Point po specifikacijah za izmenjavo sporočil eDelivery in s statičnim iskanjem. | čl. 9(2) | M | ED | T |
| SI-GATE-FR-133 | Za komunikacijo med eFTI Gate in eFTI Platform mora biti omogočena izmenjava preko eDelivery Access Point z dinamičnim iskanjem. | čl. 9(3) | M | ED | T |
| SI-GATE-FR-134 | Če MZIE odloči, da poleg eDelivery dovoli tudi enakovredne nacionalno opredeljene specifikacije za komunikacijo z eFTI Platform (npr. profil REST), morajo biti te specifikacije podrobne, posodobljene in javno dostopne. Odločitev: odprto (pogl. 5, ICD P-02). | čl. 9(4) | P | EG, OP | P |

## 6.9 Varnostni certifikati (čl. 10)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-140 | eDelivery Access Point eFTI Gate in dostopnim točkam eFTI Platform, certificiranih v Sloveniji, se morajo izdati varnostni certifikati preko certifikacijskega organa. Kateri certifikacijski organ (npr. SIGEN-CA) jih izdaja, je odprto (odloči se v pogl. 5.4, v pripravi). | čl. 10(1) | M | ED, OP | P |
| SI-GATE-FR-141 | Zasebni ključi eDelivery Access Point eFTI Gate morajo biti varno shranjeni (npr. HSM ali enakovredna rešitev, pogl. 8.5); digitalni certifikati se morajo med eFTI Gate ter med eFTI Gate in eFTI Platform prenašati na varen način. | čl. 10(2) | M | ED, OP | P, A |
| SI-GATE-FR-142 | Rešitev mora zagotavljati varne mehanizme za prejemanje, evidentiranje, pridobivanje in potrjevanje javnih ključev ali certifikatov povezanih eFTI Platform; za ta namen se lahko uporabi register SMP z ustreznimi varnostnimi mehanizmi. | čl. 10(3) | M | UP, ED | D, T |

## 6.10 Registry of Identifiers (čl. 11)

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-150 | Registry of Identifiers mora eFTI Platform omogočiti nalaganje UIL skupaj z identifikatorji ter nalaganje, aktivacijo, deaktivacijo in izbris UIL in identifikatorjev. | čl. 11(1) | M | RoI | T |
| SI-GATE-FR-151 | eFTI Gate mora iz UIL razbrati identifikator eFTI Gate, identifikator eFTI Platform in UUID eFTI dataset, ki ga dodeli eFTI Platform. | čl. 11(2) | M | SM, RoI | T |
| SI-GATE-FR-152 | eFTI Gate mora imeti identifikator, ki omogoča enoznačno odkrivanje v okolju eFTI (dogovor o poimenovanju: ICD v0.5, P-22; odprto). | čl. 11(2)(a) | M | EG, OP | P |
| SI-GATE-FR-153 | Registry of Identifiers mora podpirati vsaj identifikatorje eFTI39, eFTI188, eFTI374, eFTI378, eFTI448, eFTI581, eFTI578, eFTI618, eFTI620, eFTI987, eFTI1000 in eFTI1451 (prevoz nevarnega blaga – oznaka). | čl. 11(3) | M | RoI | T |
| SI-GATE-FR-154 | Registry of Identifiers mora UIL aktivirati in dati na voljo za poizvedbe takoj po nalaganju ter jo deaktivirati, ko je naložen identifikator eFTI188. | čl. 11(4) | M | RoI | T |
| SI-GATE-FR-155 | Za UIL, pri katerih ima eFTI581 vrednost »3« (cestni prevoz), mora register UIL deaktivirati šele po izteku obdobja iz čl. 8(2) Uredbe (ES) št. 1072/2009; obdobje mora biti nastavljivo. | čl. 11(4) | M | RoI | T |
| SI-GATE-FR-156 | Po deaktivaciji mora register UIL in z njo povezane identifikatorje izbrisati. | čl. 11(4) | M | RoI | T |

## 6.11 Mreža za tehnično in operativno podporo (čl. 12–13)

Organizacijske zahteve so v pogl. 13; tu so le zahteve, ki vplivajo na rešitev.

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-FR-170 | Rešitev mora podpirati službo za pomoč uporabnikom na prvi ravni (za uradnike) in na drugi ravni (za službe prve ravni pristojnih organov in eFTI Platform); delitev vlog med MZIE, izvajalcem in organi bo določena v pogl. 13 (v pripravi). | čl. 12(1) | M | OP | P |
| SI-GATE-FR-171 | Službe za pomoč morajo biti na voljo ob delavnikih vsaj med 10.00 in 16.00 (CET/CEST), razen ob praznikih; ob koncih tedna in praznikih mora biti na voljo dežurstvo za nujne zadeve. | čl. 12(4) | M | OP | P |
| SI-GATE-FR-172 | Služba za pomoč mora uporabljati orodje, ki omogoča enotno identifikacijo vsake prošnje in nadaljnje ukrepanje, tudi med službami različnih ravni (izmenjava zahtevkov po TG1.3 eFTI governance). | čl. 12(5) | M | OP | D |
| SI-GATE-FR-173 | Služba za pomoč mora voditi dnevnike vseh prošenj in njihove zgodovine ter redno poročati o dejavnostih. | čl. 12(6) | M | OP | P |
| SI-GATE-FR-174 | Službe za pomoč morajo biti na voljo od datuma iz čl. 5(1) Uredbe (EU) 2020/1056. | čl. 12(8) | M | OP | P |
| SI-GATE-FR-175 | Izvajalec mora nacionalni kontaktni točki eFTI (čl. 13(2)) zagotavljati podatke o stanju delovanja slovenskega eFTI Gate. | čl. 13(3)(a) | M | OP | P |

## 6.12 Odprta vprašanja za MZIE

1. **Obseg AAP, Authorisation Registry in UAP** v ločenem JN (čl. 4(4)); odloči M2.
2. **Certifikacijski organ** za varnostne certifikate eDelivery Access Point (čl. 10(1)).
3. **Nacionalni profil REST** za komunikacijo z eFTI Platform (čl. 9(4)).
4. **Čl. 6(4)**: Slovenska akreditacija po implementacijskem načrtu (20. 5. 2026) še ne more akreditirati organov za ugotavljanje skladnosti, zato bo postopek priklopa eFTI Platform, certificiranih v drugih DČ, verjetno potreben že ob zagonu.
5. **Spremembe IU 2024/1942**: TGD v1.0.1 (tabela 4) napoveduje razširitev seznama identifikatorjev iz čl. 11(3); obravnava v SI-GATE-FR-213.
