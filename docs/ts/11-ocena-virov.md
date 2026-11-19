# 11 Ocena virov

> **Zahteva:** TS javnega naročila, točka 2.4: finančni, kadrovski in organizacijski viri
>
> **Viri:** pogl. 6–10 te TS; časovnica (pogl. 10); NL PvE pogl. 8; eFTI4LIVE D2.2 (razvoj RI); TIS Annex 7 (ocena stroškov eFTI Gate) in model stroškov eFTI4ALL (za finančno oceno); cenovno ovrednotene variante iz M2
>
> **Status:** osnutek v0.2 (19. 11. 2026), za interni pregled

## 11.0 Način zapisa

Poglavje določa delovne sklope (DS) za izvedbo ločenega JN, vloge izvajalca z zahtevanimi znanji, ključne kadre, ki jih ponudnik imenuje v ponudbi, vire naročnika in oceno obsega dela v osebnih mesecih (OM). Ocene so **[predlog]**; preveriti jih je treba z varianto iz M2 in s TIS Annex 7 oziroma modelom stroškov eFTI4ALL. Zahteve so `SI-GATE-NFR-4NN` (stolpci kot v 6.0).

## 11.1 Delovni sklopi

| DS | Naziv | Cilj in obseg | Zahteve (pogl.) | Elementi C4 | Glavni izdelki | Faza / izdaja | Vloge |
|---|---|---|---|---|---|---|---|
| DS1 | Vodenje projekta in kakovost | načrtovanje po fazah G0–G3, kritična pot, tveganja, poročanje, upravljanje sprememb, sodelovanje v eFTI4LIVE (TG2.2, integracijsko omrežje) | 10, 8.6, 8.9 | — | terminski načrt (NFR-300), dvotedenska poročila (NFR-305), register tveganj | G0–G3, R2 | V1, V2 |
| DS2 | Arhitektura, varnost in skladnost | arhitekturni opis (C4, ADR), ocena tveganj (ENISA, STRIDE), varnostni koncept, zasnova skladnosti z ZInfV-1 in GDPR | 5, 8.5, ADR | vsi | arhitekturni opis, ocena tveganj (NFR-052), varnostni koncept | G0–G1, posodobitve | V2, V3 |
| DS3 | Jedro eFTI Gate | eFTI Gate Service na osnovi RI: G2G in G2P, Registry of Identifiers, search mechanism, časovniki, revizijska sled, preverjanje certifikacijskega statusa | 6.5, 6.7, 6.10, 7.1, 7.2, 7.4 | `gate.gateService`, `gate.db`, `gate.mq`, `gate.logStore` | izvorna koda, avtomatizirani testi | G0–G2 (R1) | V4, V5, V9, V2 |
| DS4 | eDelivery in PKI | dostopovna točka za eDelivery (Domibus), PMode, statično in dinamično odkrivanje (SML/SMP), certifikati, HSM, zamenjava ključev | 6.8, 6.9, 7.7, 8.5.2 | `gate.ap`, `gate.apDb` | nameščena dostopovna točka, postopki za ključe in certifikate | G0–G1 (R1), SML/SMP po RI | V6, V10, V3 |
| DS5 | Storitve OpenAPI in integracija z organi | eFTI Gate AAP API, Administration API, Audit and Statistics API; OAuth 2.0/OIDC; povezava z AAP organov in nacionalnimi gradniki e-identitete; Authorisation Registry API (R2) | 7.3, 7.5, 7.9, Priloga E | `gate.aapApi`, `gate.adminApi`, `gate.auditApi`, `gate.arApi`, `gate.idp` | implementirane storitve, pogodbeni testi, dokumentacija za razvijalce | G1–G2 (R1), R2 | V7, V4, V5 |
| DS6 | Upravljavska aplikacija | upravljanje registrov, priklop eFTI Platform (tudi čl. 6(4)), šifranti, pregled revizijske sledi, statistika; dostopnost | 7.6, 8.3 | `gate.adminApp` | spletna aplikacija, navodila | G1–G2 (R1) | V8, V7 |
| DS7 | Infrastruktura, DevOps in nadzor | okolja (razvojno, testno, predprodukcijsko, produkcijsko), CI/CD, vsebniki, nadzor in SIEM, varnostne kopije, obnova | 8.1, 8.4, 8.6, 9.2 | `gate.monitoring`, vsa okolja | infrastruktura kot koda, postopki obnove, nadzorne plošče | G0–G3 | V10, V3 |
| DS8 | Testiranje, skladnost in prevzem | testni načrt, skladnost proti RI, TCT/Launchpad, Testfest, zmogljivost, koordinacija penetracijskega testa, UAT z organi, prevzem F1–F5 | 9.1–9.6 | vsi | testni načrt (NFR-200), poročila, zapisniki prevzema | G0–G3 | V11, V12, V3 |
| DS9 | Priklop eFTI Platform in pilotno delovanje | postopek priklopa, test povezave, pilotna eFTI Platform, okolje TCT pri eFTI Gate (R2), politika priklopa (PRA) | 9.5, 9.7 | `gate.tct`, `gate.adminApi` | navodila za priklop, rezultati pilotov | G2–G3 (R1), R2 | V6, V11, V13 |
| DS10 | Obratovanje, služba za pomoč in prenos znanja | služba za pomoč (raven 2, čl. 12), SLA, upravljanje incidentov in sprememb (ITIL), poročanje, vzdrževanje in posodabljanje (XSD, RI), usposabljanje MZIE in organov | 6.11, 8.7, 8.9, 13 | `gate.monitoring`, `gate.auditApi` | priročniki, usposabljanja, mesečna poročila | od G3 dalje | V13, V14, V1 |

## 11.2 Vloge izvajalca in zahtevana znanja

| Oznaka | Vloga | Naloge | Zahtevana znanja (oznake iz 11.3) |
|---|---|---|---|
| V1 | Vodja projekta | vodenje DS1 in DS10, odnos z MZIE, kritična pot, tveganja | K1, K11; vodenje projektov javnega sektorja |
| V2 | Arhitekt rešitve eFTI | arhitekturna celovitost, odločitve (ADR), usklajevanje z ICD, TGD in RI | K1, K2, K4, K5, K7, K13 |
| V3 | Strokovnjak za informacijsko varnost | ocena tveganj, varnostni koncept, skladnost z ZInfV-1, koordinacija penetracijskega testa | K3, K9 |
| V4 | Vodilni razvijalec | tehnično vodenje razvoja DS3 in DS5, pregledi kode, gradnja na RI | K4, K5, K7, K2 |
| V5 | Razvijalec zaledja | razvoj eFTI Gate Service in storitev OpenAPI | K4, K5 |
| V6 | Strokovnjak za eDelivery in PKI | Domibus, PMode, SML/SMP, certifikati in HSM, priklop eFTI Gate drugih DČ | K2, K3 |
| V7 | Strokovnjak za API in identitete | storitve OpenAPI, OAuth 2.0/OIDC, mTLS, povezava z AAP in nacionalnimi gradniki e-identitete | K5, K6, K9 |
| V8 | Razvijalec spletnih aplikacij | upravljavska aplikacija | K12, K5 |
| V9 | Strokovnjak za podatkovne modele eFTI | XSD, sporočila FTI, šifranti, prilagoditve novim različicam | K7, K1 |
| V10 | Inženir DevOps in infrastrukture | okolja, CI/CD, nadzor, varnostne kopije, obnova | K8, K9 |
| V11 | Vodja testiranja | testni načrt, skladnost, prevzem, UAT | K10, K1 |
| V12 | Testni inženir | avtomatizacija, obremenitveni in pogodbeni testi | K10, K5 |
| V13 | Strokovnjak za obratovanje in službo za pomoč | služba za pomoč (raven 2), incidenti, SLA, poročanje | K11, K1, K2 |
| V14 | Tehnični pisec in izobraževalec | dokumentacija, priročniki, usposabljanja | K1 (osnove); slovenski in angleški jezik |

## 11.3 Področja znanja

| Oznaka | Področje znanja |
|---|---|
| K1 | Uredba (EU) 2020/1056, IU 2024/1942, DU 2024/2024, IU 2025/2243; TGD in ICD; vloge v okolju eFTI |
| K2 | eDelivery: AS4, Domibus, PMode, statično in dinamično odkrivanje (SML/SMP) |
| K3 | PKI, X.509, upravljanje ključev, HSM, preklic (OCSP/CRL) |
| K4 | Java 21, Spring Boot, RabbitMQ, PostgreSQL; referenčna implementacija eFTI Gate |
| K5 | REST, OpenAPI 3.1, OAuth 2.0, OpenID Connect, mTLS, RFC 9457 |
| K6 | nacionalni gradniki e-identitete (SI-PASS, SI-CAS, SIGEN-CA) in eIDAS |
| K7 | XML, XSD, UN/CEFACT, podatkovni model eFTI (skupni nabor in podsklopi) |
| K8 | vsebniki (OCI), orkestracija, CI/CD, infrastruktura kot koda, nadzor, SIEM, varnostne kopije |
| K9 | informacijska varnost: ZInfV-1/NIS2, ISO/IEC 27001, GDPR in ZVOP-2, OWASP ASVS |
| K10 | testiranje: avtomatizacija, pogodbeni, obremenitveni in varnostni testi, testi skladnosti (RI, TCT) |
| K11 | ITIL (incidenti, spremembe, znanje), SLA, služba za pomoč |
| K12 | spletni uporabniški vmesniki, dostopnost WCAG 2.1 AA |
| K13 | modeliranje arhitekture (C4, Structurizr) in arhitekturne odločitve (ADR) |

**Matrika znanj** (● zahtevano, ○ zaželeno):

| Vloga | K1 | K2 | K3 | K4 | K5 | K6 | K7 | K8 | K9 | K10 | K11 | K12 | K13 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| V1 | ● | | | | | | | | ○ | | ● | | |
| V2 | ● | ● | ○ | ● | ● | ○ | ● | ○ | ○ | | | | ● |
| V3 | ○ | ○ | ● | | ○ | ○ | | ○ | ● | ○ | | | |
| V4 | ○ | ● | | ● | ● | | ● | ○ | ○ | ○ | | | |
| V5 | | ○ | | ● | ● | | ○ | | | ○ | | | |
| V6 | ○ | ● | ● | ○ | | | | ○ | ○ | | | | |
| V7 | | | ○ | ○ | ● | ● | | | ● | ○ | | | |
| V8 | | | | | ● | | | | | | | ● | |
| V9 | ● | | | ○ | | | ● | | | | | | |
| V10 | | ○ | ○ | | | | | ● | ● | | ○ | | |
| V11 | ● | ○ | | | ○ | | | | | ● | | | |
| V12 | | | | ○ | ● | | | ○ | | ● | | | |
| V13 | ● | ● | | | | | | ○ | | | ● | | |
| V14 | ○ | | | | | | | | | | | | |

## 11.4 Ključni kadri v ponudbi

Ponudnik v ponudbi imenuje ključne kadre in za vsakega predloži reference. Spodnji pogoji so **[predlog]**; o pogojih in merilih ter o sorazmernosti (ZJN-3) odloči MZIE. Kjer je naveden certifikat, se šteje tudi enakovredno dokazilo.

| Vloga | Najmanj delovnih izkušenj | Reference v zadnjih 5 letih | Zaželeni certifikati (ali enakovredno) |
|---|---|---|---|
| V1 Vodja projekta | 5 let vodenja projektov IT | 1 projekt informacijskega sistema za javni sektor, z integracijo zunanjih sistemov | PMP, PRINCE2 ali IPMA |
| V2 Arhitekt rešitve eFTI | 5 let arhitekture integracijskih sistemov | 1 projekt čezmejne ali medinstitucionalne izmenjave podatkov (npr. eDelivery, Peppol, e-CODEX ali podobno) | TOGAF ali enakovredno |
| V3 Strokovnjak za informacijsko varnost | 5 let na področju informacijske varnosti | 1 ocena tveganj ali varnostni koncept za sistem javnega sektorja | CISSP, CISM ali ISO/IEC 27001 Lead Implementer |
| V4 Vodilni razvijalec | 5 let razvoja v Javi, od tega 2 leti s Spring Boot | 1 projekt sistema z vmesniki REST in asinhrono obdelavo | — |
| V6 Strokovnjak za eDelivery in PKI | 2 leti dela z AS4 oziroma Domibus | 1 vzpostavljena dostopovna točka za eDelivery ali enakovredna izmenjava s PKI | — |
| V11 Vodja testiranja | 3 leta vodenja testiranja | 1 projekt z avtomatiziranim testiranjem vmesnikov in prevzemom pri naročniku | ISTQB Advanced Test Manager |

## 11.5 Viri naročnika

| Vloga pri MZIE ali organih | Naloge | Ocenjeni obseg [predlog] |
|---|---|---|
| Lastnik storitve in vodja projekta MZIE | odločitve o obsegu, prevzem faz, odnos z izvajalcem in eFTI4LIVE | 0,5–1,0 FTE med gradnjo, 0,3 FTE v obratovanju |
| Nacionalna kontaktna točka eFTI | mreža za operativno podporo (čl. 13), eDANOS, poročanje (čl. 17) | 0,3 FTE |
| Pooblaščenec za informacijsko varnost | skladnost z ZInfV-1, odobritev varnostnega koncepta, incidenti | 0,2 FTE |
| Pooblaščena oseba za varstvo podatkov | ocena učinka (GDPR), pogodba o obdelavi | 0,1 FTE |
| Pravna služba | uredba vlade o izvajanju, odločitev o PRA, čl. 6(4), pogodbe | 0,2 FTE med gradnjo |
| Koordinatorji pristojnih organov (Policija, FURS, IRSI …) | priklop AAP, Authorisation Registry, UAT, usposabljanja | 0,2 FTE na organ med UAT |
| Nadzor izvedbe (inženirsko svetovanje) | strokovni nadzor in prevzem (pogl. 12) | po pogodbi |

Pravočasne naloge naročnika pred podpisom pogodbe (identifikator eFTI Gate, certifikacijski organ, prijava v integracijsko omrežje) so v 10.4.

## 11.6 Ocena obsega dela izvajalca

FTE = povprečni delež polnega delovnega časa v obdobju; OM = osebni meseci. Trajanje: R1 3,1 meseca (osnovni scenarij, 6. 4.–9. 7. 2027), R2 6 mesecev, obratovanje 12 mesecev na leto. R2 poteka hkrati s prvim letom obratovanja; obsega se seštevata.

| Oznaka | Vloga | R1 FTE | R1 OM | R2 FTE | R2 OM | Obratovanje FTE | Obratovanje OM/leto |
|---|---|---|---|---|---|---|---|
| V1 | Vodja projekta | 1,0 | 3,1 | 0,5 | 3,0 | 0,2 | 2,4 |
| V2 | Arhitekt rešitve eFTI | 1,0 | 3,1 | 0,5 | 3,0 | 0,1 | 1,2 |
| V3 | Strokovnjak za informacijsko varnost | 0,5 | 1,6 | 0,3 | 1,8 | 0,2 | 2,4 |
| V4 | Vodilni razvijalec (Java, Spring Boot) | 1,0 | 3,1 | 1,0 | 6,0 | 0,3 | 3,6 |
| V5 | Razvijalec zaledja (Java), 2 osebi | 2,0 | 6,2 | 1,0 | 6,0 | 0,2 | 2,4 |
| V6 | Strokovnjak za eDelivery in PKI | 1,0 | 3,1 | 0,3 | 1,8 | 0,1 | 1,2 |
| V7 | Strokovnjak za API in identitete | 1,0 | 3,1 | 0,5 | 3,0 | 0,1 | 1,2 |
| V8 | Razvijalec spletnih aplikacij | 1,0 | 3,1 | 0,5 | 3,0 | 0,1 | 1,2 |
| V9 | Strokovnjak za podatkovne modele eFTI | 0,5 | 1,6 | 0,3 | 1,8 | 0,1 | 1,2 |
| V10 | Inženir DevOps in infrastrukture | 1,0 | 3,1 | 0,5 | 3,0 | 0,3 | 3,6 |
| V11 | Vodja testiranja | 1,0 | 3,1 | 0,5 | 3,0 | 0,1 | 1,2 |
| V12 | Testni inženir | 1,0 | 3,1 | 0,5 | 3,0 | 0,1 | 1,2 |
| V13 | Strokovnjak za obratovanje in službo za pomoč (raven 2) | 0,5 | 1,6 | 1,0 | 6,0 | 1,5 | 18,0 |
| V14 | Tehnični pisec in izobraževalec | 0,3 | 0,9 | 0,2 | 1,2 | 0,1 | 1,2 |
| | **Skupaj** | **12,8** | **39,7** | **7,6** | **45,6** | **3,5** | **42,0** |

Skupaj za R1, R2 in prvo leto obratovanja: približno **127,3 OM** [predlog]. Gradnja R1 zahteva **12,8 FTE** sočasno; pri pospešenem scenariju (R1 4,3 meseca, pogl. 10.3) je potrebna sočasnost manjša pri enakem obsegu dela. Gradnja na referenčni implementaciji (ADR-0002) je pogoj za ta obseg.

**Finančna ocena** je odprta: OM iz te tabele je treba pomnožiti s cenami dela in dodati stroške infrastrukture po pogl. 5.5 (viri po okoljih, strojna oprema za varianto H2, co-location ali DRO), licenc, HSM, penetracijskih testov in gostovanja (odvisno od variante v M2); rezultat primerjati s TIS Annex 7 in modelom stroškov eFTI4ALL.

## 11.7 Zahteve za kadre izvajalca

| Oznaka | Zahteva | Vir | P | Komp. | Preverjanje |
|---|---|---|---|---|---|
| SI-GATE-NFR-400 | Ponudnik mora v ponudbi imenovati ključne kadre iz 11.4 in dokazati izpolnjevanje pogojev; menjava ključnega kadra je mogoča le s kadrom enakih kvalifikacij in s pisnim soglasjem MZIE. | 11.4; [predlog] | M | OP | P |
| SI-GATE-NFR-401 | Izvajalec mora s terminskim načrtom (SI-GATE-NFR-300) predložiti kadrovski načrt po vlogah iz 11.2, ki zagotavlja obseg iz 11.6 v vsaki fazi. | 11.6 | M | OP | P |
| SI-GATE-NFR-402 | Komunikacija z MZIE in organi, uporabniška dokumentacija in služba za pomoč morajo biti v slovenskem jeziku; služba za pomoč na drugi ravni mora komunicirati tudi v angleščini (druge DČ, raven 3 EK). | čl. 12; SI-GATE-NFR-020 | M | OP | P |
| SI-GATE-NFR-403 | Osebe izvajalca z dostopom do produkcijskega okolja ali dnevnikov morajo podpisati izjavo o varovanju podatkov, opraviti varnostno usposabljanje in izpolnjevati nacionalne zahteve za dostop do sistemov državne uprave [preveriti]. | ZInfV-1; SI-GATE-NFR-054 | M | OP | P |
| SI-GATE-NFR-404 | Izvajalec mora pred zagonom izvesti usposabljanje za upravljavce eFTI Gate in službo za pomoč (vsaj 16 ur) [predlog] ter za koordinatorje pristojnih organov (vsaj 4 ure na organ) [predlog] in predati gradivo. | 8.6, 13; NL PvE | M | OP | D |
| SI-GATE-NFR-405 | Arhitekt rešitve ali vodilni razvijalec izvajalca mora sodelovati na sestankih TG2.2 eFTI4LIVE in v integracijskem omrežju v imenu MZIE ter o odločitvah poročati v poročilih iz SI-GATE-NFR-305. | ADR-0002; pogl. 10 | M | OP | P |
| SI-GATE-NFR-406 | Ob koncu pogodbe ali zamenjavi izvajalca mora izvajalec izvesti prenos znanja novemu izvajalcu ali MZIE v obsegu, potrebnem za neprekinjeno obratovanje (vsaj 1 mesec vzporednega dela) [predlog]. | SI-GATE-NFR-151 | M | OP | P |
