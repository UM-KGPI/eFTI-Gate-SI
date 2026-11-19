/*
 * eFTI Gate (slovenski prehod eFTI, eFTI-vrata) – model C4 (osnutek v0.2, 19. 11. 2026)
 * Vir resnice za diagrame v Prilogi D in pogl. 5 TS (M3). Diagramov ne urejamo ročno.
 *
 * Oznake (tags):
 *   "RI"          (modra) element obstaja v referenčni implementaciji (github.com/EFTI4EU/reference-implementation)
 *   "Dodatek SI"  (zelena) ni v RI; zahteva ga produkcija ali slovenski kontekst
 *   "Odprto"      (oranžna) umestitev ali obseg še ni odločen (M2 ali EU specifikacije)
 *   "R2"          (vijolična) predvideno v izdaji R2 (pogl. 10.5); brez oznake = R1 (zagon 9. 7. 2027)
 *
 * Lastnost "komp" je oznaka komponente iz stolpca Komp. v pogl. 6–10 in Prilogi C
 * (EG, SM, RoI, ED, AAP, AR, UAP, UP, OP, TCT); scripts/build-traceability.py iz nje doda stolpec »Element C4«.
 * Številke vmesnikov sledijo ICD v0.5 §3.1 (osnutek); v modelu so uporabljeni #1–#3.
 */
workspace "eFTI Gate (SI)" "Model C4 za tehnične specifikacije (M3)" {

    !identifiers hierarchical

    model {
        properties {
            "structurizr.groupSeparator" "/"
        }

        # ---------- Osebe ----------
        uradnik = person "Uradnik pristojnega organa" "Policist, inšpektor ali carinik, ki med nadzorom zahteva podatke eFTI (čl. 1(3) IU 2024/1942)." "Zunanji"
        operater = person "Upravljavec eFTI Gate" "Skrbnik pri MZIE ali izvajalcu vzdrževanja; nacionalna služba za pomoč (raven 2)."
        gospodarskiSubjekt = person "Gospodarski subjekt" "Prevoznik, špediter, pošiljatelj ali prejemnik; podatke eFTI vodi na certificirani eFTI Platform." "Zunanji"

        # ---------- Sistemi ----------
        group "Slovenija" {
            vrata = softwareSystem "eFTI Gate" "Slovenski eFTI Gate (čl. 6 IU 2024/1942) z search mechanism (čl. 8) in Registry of Identifiers (čl. 11)." {
                properties {
                    "komp" "EG"
                }

                gateService = container "eFTI Gate Service" "Jedro eFTI Gate: vmesniki, obdelava zahtev, usmerjanje, revizijska sled. V RI ena storitev iz knjižnic." "Java 21+, Spring Boot" "RI" {
                    properties {
                        "komp" "EG"
                    }
                    jedro = component "Jedro (Gate Core)" "Obdelava zahtev prek UIL, iskanj po identifikatorjih in follow-up communication; vloga requesting eFTI Gate in receiving eFTI Gate; časovna omejitev 60 s." "Spring Boot" "RI" {
                        properties {
                            "komp" "EG"
                        }
                    }
                    iskalnik = component "Search mechanism" "Iz UIL razbere eFTI Gate in eFTI Platform, išče v Registry of Identifiers, posreduje iskanja drugim eFTI Gate, združi rezultate (čl. 8; TGD §6.2–6.3)." "Java" "RI" {
                        properties {
                            "komp" "SM"
                        }
                    }
                    roi = component "Registry of Identifiers" "Nalaganje, zamenjava, aktivacija, deaktivacija in izbris UIL z identifikatorji; nastavljiv nabor identifikatorjev (čl. 11; TGD §6.1, 6.4)." "Java" "RI" {
                        properties {
                            "komp" "RoI"
                        }
                    }
                    registri = component "Registri povezav" "Register eFTI Gate drugih DČ (ID, certifikati), register AAP (ID, certifikati), Registry of eFTI Platforms (ID, ključi, certifikacijski status, politika priklopa) (čl. 6(3)(d)–(f))." "Java" "Dodatek SI" {
                        properties {
                            "komp" "EG"
                        }
                    }
                    certCheck = component "Preverjanje certifikacijskega statusa" "Preveri ključ in certifikacijski status eFTI Platform pred izmenjavo (čl. 6(2)(d)(i)); dnevna sinhronizacija z Unijskim referenčnim seznamom je R2." "Java" "Dodatek SI,Odprto" {
                        properties {
                            "komp" "EG"
                        }
                    }
                    edeliveryConnector = component "Povezovalnik eDelivery" "Abstrakcija komunikacije z dostopno točko AS4; preslikava korelacijskih identifikatorjev v glavo AS4." "Java" "RI" {
                        properties {
                            "komp" "ED"
                        }
                    }
                    wsPlugin = component "Odjemalec WS (WS Plugin)" "SOAP odjemalec za Domibus WS plugin." "Java, SOAP" "RI" {
                        properties {
                            "komp" "ED"
                        }
                    }
                    logger = component "Revizijska sled in dnevniki" "Obvezni zapisi po čl. 6(2)(c), (g) in TGD §9.2; časovni žigi v ms; zaščita pred spremembami (TGD §9.3)." "Java, JSON" "RI,Dodatek SI" {
                        properties {
                            "komp" "EG"
                        }
                    }
                    statistika = component "Statistika in metrike" "Metrike za nadzor delovanja; letna statistika dostopov za poročanje po čl. 17 Uredbe (EU) 2020/1056." "Java" "Dodatek SI" {
                        properties {
                            "komp" "EG"
                        }
                    }
                    commons = component "Skupna knjižnica" "Modeli sporočil po XSD, validacija ovojnice in glave, pretvorbe med različicami." "Java" "RI" {
                        properties {
                            "komp" "EG"
                        }
                    }
                }

                caApi = container "eFTI Gate AAP API (#3)" "OpenAPI: zahteve prek UIL, iskanja po identifikatorjih, follow-up communication; asinhrono (requestId). Pot /v1/aap/control/..." "REST/JSON, mTLS, OAuth 2.0" "API,RI" {
                    properties {
                        "openapi" "interfaces/openapi/efti-gate-aap-api.yaml"
                        "komp" "EG"
                    }
                }
                mq = container "Sporočilni posrednik" "Trajna vrsta asinhronih zahtev." "RabbitMQ" "RI,Queue" {
                    properties {
                        "komp" "EG"
                    }
                }
                db = container "Podatkovna baza eFTI Gate" "Registry of Identifiers, registri povezav, stanje zahtev." "PostgreSQL" "RI,Database" {
                    properties {
                        "komp" "RoI"
                    }
                }
                ap = container "eDelivery Access Point" "AS4 za #1 (statično odkrivanje) in #2 (SML/SMP); PMode po TGD Annex 1; ključi v HSM." "Domibus (EK), AS4" "RI" {
                    properties {
                        "komp" "ED"
                    }
                }
                apDb = container "Baza dostopne točke" "Sporočila in konfiguracija Domibus." "MariaDB" "RI,Database" {
                    properties {
                        "komp" "ED"
                    }
                }
                idp = container "Strežnik identitet" "OIDC/OAuth2 za upravljavce in strojne odjemalce; v RI le primer (Keycloak)." "OIDC (npr. Keycloak)" "RI,Dodatek SI" {
                    properties {
                        "komp" "EG"
                    }
                }
                admin = container "Upravljavska aplikacija" "Registri povezav, priklop eFTI Platform (tudi čl. 6(4)), certifikati, šifranti, pregled revizijskih sledi, statistika." "Spletna aplikacija" "Dodatek SI" {
                    properties {
                        "komp" "UP"
                    }
                }
                adminApi = container "eFTI Gate Administration API" "OpenAPI: registri eFTI Gate, AAP in Registry of eFTI Platforms, priklop (čl. 6(4)), začasni odklop, šifranti, sinhronizacija statusov (R2)." "REST/JSON, mTLS, OIDC" "API,Dodatek SI" {
                    properties {
                        "komp" "UP"
                        "openapi" "interfaces/openapi/efti-gate-admin-api.yaml"
                    }
                }
                auditApi = container "eFTI Gate Audit and Statistics API" "OpenAPI: iskanje po revizijski sledi, izvozi za pristojne organe, letna statistika (čl. 17 Uredbe 2020/1056)." "REST/JSON, mTLS, OIDC" "API,Dodatek SI" {
                    properties {
                        "komp" "EG"
                        "openapi" "interfaces/openapi/efti-gate-audit-api.yaml"
                    }
                }
                arApi = container "eFTI Authorisation Registry API" "OpenAPI: pravice dostopa in obdelave uradnikov, zgodovina sprememb (čl. 5). Pogojno po M2." "REST/JSON, mTLS, OAuth 2.0" "API,Dodatek SI,Odprto,R2" {
                    properties {
                        "komp" "AR"
                        "openapi" "interfaces/openapi/efti-authorisation-registry-api.yaml"
                    }
                }
                logStore = container "Shramba revizijskih sledi" "Nespremenljiva hramba (npr. WORM ali veriženje zgoščenih vrednosti), 2 leti ali več (čl. 6(2)(h))." "" "Dodatek SI,Database" {
                    properties {
                        "komp" "OP"
                    }
                }
                monitoring = container "Nadzor delovanja in SIEM" "Metrike, alarmi, varnostni dogodki; povezava s SOC." "" "Dodatek SI" {
                    properties {
                        "komp" "OP"
                    }
                }
                tct = container "Okolje TCT za eFTI Platform" "Usklajeni testni scenariji TCT za vmesnik #2 pred priklopom eFTI Platform (decentraliziran model M2.3)." "" "Dodatek SI,Odprto,R2" {
                    properties {
                        "komp" "TCT"
                    }
                }
            }

            organi = softwareSystem "Sistemi pristojnih organov (AAP, Authorisation Registry, UAP)" "AAP (čl. 4), Authorisation Registry (čl. 5) in UAP (čl. 7) Policije, FURS, IRSI in drugih organov. V eFTI Gate ali pri organih: odloči M2 (čl. 4(4))." "Odprto" {
                properties {
                    "komp" "AAP"
                }
            }
            platformaSI = softwareSystem "eFTI Platform (SI)" "eFTI Platform, certificirane v Sloveniji ali priključene po čl. 6(4)." "Zunanji"
            siGradniki = softwareSystem "Nacionalni gradniki e-identitete" "SI-PASS, SI-CAS, SIGEN-CA." "Zunanji"
            akreditacija = softwareSystem "Nacionalni seznam certificiranih eFTI Platform" "Imenovani organ in organi za ugotavljanje skladnosti (akreditira Slovenska akreditacija)." "Zunanji,Odprto"
        }

        group "EU eFTI okolje" {
            tujaVrata = softwareSystem "eFTI Gate drugih DČ" "Mrežna topologija eFTI Gate." "Zunanji"
            referencniSeznam = softwareSystem "Unijski referenčni seznam" "Statusi certifikatov eFTI Platform (DU o certificiranju, v sprejemanju)." "Zunanji,Odprto"
            smlSmp = softwareSystem "eDelivery SML/SMP" "Dinamično odkrivanje eFTI Platform za #2." "Zunanji"
            tujePlatforme = softwareSystem "eFTI Platform drugih DČ" "Priključene na eFTI Gate drugih DČ." "Zunanji"
            helpdeskEU = softwareSystem "Služba za pomoč EK (raven 3)" "Čl. 12(2) IU 2024/1942." "Zunanji"
        }

        group "Testno okolje eFTI4LIVE" {
            ri = softwareSystem "Referenčni eFTI Gate (RI) in Launchpad" "Sidro skladnosti v integracijskem omrežju; TCT in varnostni testi s podpisanim poročilom." "Zunanji,Test"
        }

        # ---------- Odnosi: osebe ----------
        uradnik -> organi "Vloži zahtevo za dostop ali follow-up communication"
        gospodarskiSubjekt -> platformaSI "Vodi podatke eFTI"
        operater -> vrata.admin "Upravlja eFTI Gate"
        vrata.monitoring -> operater "Alarmi"
        operater -> helpdeskEU "Prijave na raven 3"

        # ---------- Odnosi: zunanji ----------
        organi -> vrata.caApi "#3 G2A: zahteve prek UIL, iskanja, follow-up communication" "REST/JSON, mTLS"
        organi -> siGradniki "Identifikacija uradnikov" "SAML/OIDC"
        vrata.ap -> platformaSI "#2 G2P: zahteve za eFTI dataset, follow-up communication" "AS4"
        platformaSI -> vrata.ap "#2 P2G: nalaganje identifikatorjev, odgovori" "AS4"
        vrata.ap -> tujaVrata "#1 G2G: posredovanje zahtev in iskanj" "AS4, statično odkrivanje"
        tujaVrata -> vrata.ap "#1 G2G: zahteve in iskanja drugih DČ, odgovori" "AS4"
        tujaVrata -> tujePlatforme "#2 G2P" "AS4"
        vrata.ap -> smlSmp "Odkrivanje eFTI Platform" "SML/SMP"
        vrata.gateService.certCheck -> referencniSeznam "Sinhronizacija statusov certifikatov (R2)" "HTTPS"
        vrata.gateService.certCheck -> akreditacija "Nacionalni vnosi certificiranih eFTI Platform" "HTTPS ali ročno"
        vrata.ap -> ri "Testi skladnosti pred vstopom v mrežo" "AS4"
        platformaSI -> vrata.tct "Testi TCT pred priklopom (R2)" "AS4/REST"

        # ---------- Odnosi: znotraj prehoda ----------
        vrata.caApi -> vrata.gateService.jedro "Predaja zahtev"
        vrata.caApi -> vrata.idp "Preverjanje odjemalca in žetonov"
        vrata.gateService.jedro -> vrata.mq "Asinhrona obdelava" "AMQP"
        vrata.gateService.jedro -> vrata.gateService.iskalnik "Razreši cilj, išči"
        vrata.gateService.jedro -> vrata.gateService.registri "Preveri pošiljatelja (AAP, eFTI Gate)"
        vrata.gateService.jedro -> vrata.gateService.certCheck "Preveri eFTI Platform"
        vrata.gateService.jedro -> vrata.gateService.edeliveryConnector "Pošlji in prejmi sporočila"
        vrata.gateService.jedro -> vrata.gateService.logger "Revizijska sled"
        vrata.gateService.jedro -> vrata.gateService.statistika "Dogodki"
        vrata.gateService.jedro -> vrata.gateService.commons "Validacija in modeli"
        vrata.gateService.jedro -> vrata.db "Stanje zahtev" "JDBC"
        vrata.gateService.iskalnik -> vrata.gateService.roi "Lokalno iskanje"
        vrata.gateService.iskalnik -> vrata.gateService.registri "eFTI Gate za posredovanje iskanj"
        vrata.gateService.iskalnik -> vrata.gateService.edeliveryConnector "Iskanje v drugih eFTI Gate"
        vrata.gateService.certCheck -> vrata.gateService.registri "Registry of eFTI Platforms"
        vrata.gateService.roi -> vrata.db "Zapisi UIL in identifikatorjev" "JDBC"
        vrata.gateService.registri -> vrata.db "Registri povezav" "JDBC"
        vrata.gateService.edeliveryConnector -> vrata.gateService.wsPlugin "Uporablja"
        vrata.gateService.wsPlugin -> vrata.ap "Pošiljanje in prejem sporočil AS4" "SOAP/HTTPS"
        vrata.ap -> vrata.gateService.edeliveryConnector "Dostava prejetih sporočil" "JMS/WS"
        vrata.ap -> vrata.apDb "Sporočila" "JDBC"
        vrata.gateService.logger -> vrata.logStore "Zapisi revizijske sledi"
        vrata.gateService.logger -> vrata.monitoring "Tehnični in varnostni dogodki"
        vrata.gateService.statistika -> vrata.monitoring "Metrike"
        vrata.admin -> vrata.adminApi "Upravljanje registrov, priklopa in šifrantov" "HTTPS/JSON"
        vrata.adminApi -> vrata.gateService.registri "Branje in pisanje registrov"
        vrata.adminApi -> vrata.idp "Preverjanje žetonov"
        vrata.admin -> vrata.auditApi "Revizijska sled, izvozi, statistika" "HTTPS/JSON"
        vrata.auditApi -> vrata.gateService.statistika "Letna statistika"
        vrata.auditApi -> vrata.idp "Preverjanje žetonov"
        vrata.auditApi -> vrata.logStore "Branje revizijskih sledi"
        operater -> vrata.auditApi "Poročanje MZIE (čl. 17)" "HTTPS/JSON"
        organi -> vrata.arApi "Sinhronizacija pravic uradnikov (R2)" "REST/JSON, mTLS"
        vrata.arApi -> vrata.db "Pravice uradnikov" "JDBC"
        vrata.admin -> vrata.idp "Prijava upravljavcev (MFA)"
        vrata.tct -> vrata.gateService.registri "Rezultat TCT za priklop"

        prod = deploymentEnvironment "Produkcija" {
            lok1 = deploymentGroup "Lokacija 1"
            lok2 = deploymentGroup "Lokacija 2"
        dc1 = deploymentNode "Podatkovni center 1 (primarna lokacija)" "Aktivna lokacija; varianta gostovanja H1/H2/H3 po M2." "Slovenija" {
            dc1Dmz = deploymentNode "Cona DMZ" "Vstopna točka in eDelivery." "Požarni zid, WAF" {
                dc1Waf = infrastructureNode "Vstopna točka (reverse proxy, API gateway, WAF)" "TLS 1.2+, mTLS, omejevanje hitrosti (2 VM)." "" "Dodatek SI"
                deploymentNode "eDelivery Access Point" "" "VM, 2 × 4 vCPU / 8 GB" "" 2 {
                    containerInstance vrata.ap lok1
                }
            }
            dc1App = deploymentNode "Aplikacijska cona" "" "Virtualizacija ali gruča vsebnikov" {
                deploymentNode "eFTI Gate Service" "" "VM ali pod, 3 × 4 vCPU / 8 GB" "" 3 {
                    containerInstance vrata.gateService lok1
                    containerInstance vrata.caApi lok1
                }
                deploymentNode "Storitve upravljanja" "" "VM ali pod, 2 × 2 vCPU / 4 GB" "" 2 {
                    containerInstance vrata.adminApi lok1
                    containerInstance vrata.auditApi lok1
                    containerInstance vrata.admin lok1
                }
                deploymentNode "Strežnik identitet" "" "VM ali pod, 2 × 2 vCPU / 4 GB" "" 2 {
                    containerInstance vrata.idp lok1
                }
                deploymentNode "Sporočilni posrednik" "" "gruča, 3 × 2 vCPU / 4 GB" "" 3 {
                    containerInstance vrata.mq lok1
                }
            }
            dc1Data = deploymentNode "Podatkovna cona" "" "šifrirana shramba" {
                deploymentNode "PostgreSQL" "" "primarna + replika, 4 vCPU / 16 GB / 250 GB" "" 2 {
                    containerInstance vrata.db lok1
                }
                deploymentNode "MariaDB" "" "primarna + replika, 4 vCPU / 16 GB / 250 GB" "" 2 {
                    containerInstance vrata.apDb lok1
                }
                deploymentNode "Objektna shramba WORM" "" "≥ 1 TB" {
                    containerInstance vrata.logStore lok1
                }
            }
            dc1Mgmt = deploymentNode "Upravljalna cona" "" "dostop le prek bastiona" {
                deploymentNode "Nadzor in dnevniki" "" "2 × 4 vCPU / 16 GB / 500 GB" "" 2 {
                    containerInstance vrata.monitoring lok1
                }
                dc1Bastion = infrastructureNode "Bastion" "Upravljalni dostop z MFA." "" "Dodatek SI"
            }
            dc1Hsm = infrastructureNode "HSM (2 × v HA)" "Zasebni ključi eDelivery Access Point (FIPS 140-2/3 raven 3 ali CC EAL4+)." "PKCS#11" "Dodatek SI"
        }

        dc2 = deploymentNode "Podatkovni center 2 (rezervna lokacija)" "Pripravljena lokacija (aktivno-pasivno), RTO 4 h, RPO 15 min." "Slovenija" {
            dc2Dmz = deploymentNode "Cona DMZ" "Vstopna točka in eDelivery." "Požarni zid, WAF" {
                dc2Waf = infrastructureNode "Vstopna točka (reverse proxy, API gateway, WAF)" "TLS 1.2+, mTLS, omejevanje hitrosti (2 VM)." "" "Dodatek SI"
                deploymentNode "eDelivery Access Point" "" "VM, 2 × 4 vCPU / 8 GB" "" 2 {
                    containerInstance vrata.ap lok2
                }
            }
            dc2App = deploymentNode "Aplikacijska cona" "" "Virtualizacija ali gruča vsebnikov" {
                deploymentNode "eFTI Gate Service" "" "VM ali pod, 3 × 4 vCPU / 8 GB" "" 3 {
                    containerInstance vrata.gateService lok2
                    containerInstance vrata.caApi lok2
                }
                deploymentNode "Storitve upravljanja" "" "VM ali pod, 2 × 2 vCPU / 4 GB" "" 2 {
                    containerInstance vrata.adminApi lok2
                    containerInstance vrata.auditApi lok2
                    containerInstance vrata.admin lok2
                }
                deploymentNode "Strežnik identitet" "" "VM ali pod, 2 × 2 vCPU / 4 GB" "" 2 {
                    containerInstance vrata.idp lok2
                }
                deploymentNode "Sporočilni posrednik" "" "gruča, 3 × 2 vCPU / 4 GB" "" 3 {
                    containerInstance vrata.mq lok2
                }
            }
            dc2Data = deploymentNode "Podatkovna cona" "" "šifrirana shramba" {
                deploymentNode "PostgreSQL" "" "primarna + replika, 4 vCPU / 16 GB / 250 GB" "" 2 {
                    containerInstance vrata.db lok2
                }
                deploymentNode "MariaDB" "" "primarna + replika, 4 vCPU / 16 GB / 250 GB" "" 2 {
                    containerInstance vrata.apDb lok2
                }
                deploymentNode "Objektna shramba WORM" "" "≥ 1 TB" {
                    containerInstance vrata.logStore lok2
                }
            }
            dc2Mgmt = deploymentNode "Upravljalna cona" "" "dostop le prek bastiona" {
                deploymentNode "Nadzor in dnevniki" "" "2 × 4 vCPU / 16 GB / 500 GB" "" 2 {
                    containerInstance vrata.monitoring lok2
                }
                dc2Bastion = infrastructureNode "Bastion" "Upravljalni dostop z MFA." "" "Dodatek SI"
            }
            dc2Hsm = infrastructureNode "HSM (2 × v HA)" "Zasebni ključi eDelivery Access Point (FIPS 140-2/3 raven 3 ali CC EAL4+)." "PKCS#11" "Dodatek SI"
        }

            dc1 -> dc2 "Asinhrona replikacija podatkov in revizijskih sledi; varnostne kopije" "šifrirana povezava ≥ 1 Gbit/s"
        }
    }

    views {
        properties {
            "plantuml.sequenceDiagram" "false"
        }

        systemLandscape "C0-Pokrajina" "eFTI Gate v okolju eFTI" {
            include *
            autoLayout lr
        }

        systemContext vrata "C1-Kontekst" "Raven 1: kontekst eFTI Gate" {
            include *
            include uradnik gospodarskiSubjekt tujePlatforme
            autoLayout lr
        }

        container vrata "C2-API" "Storitve OpenAPI eFTI Gate in njihovi odjemalci (Priloga E)" {
            include vrata.caApi vrata.adminApi vrata.auditApi vrata.arApi
            include organi operater vrata.admin vrata.gateService vrata.idp vrata.logStore vrata.db
            autoLayout lr
        }

        container vrata "C2-Vsebniki" "Raven 2: vsebniki eFTI Gate (izhodišče RI, dodatki SI, R2)" {
            include *
            autoLayout lr
        }

        component vrata.gateService "C3-Komponente" "Raven 3: komponente eFTI Gate Service" {
            include *
            autoLayout lr
        }

        deployment vrata "Produkcija" "C4-Namestitev-Pregled" "Produkcija na dveh lokacijah: cone, HSM, replikacija (pogl. 5.5)" {
            include prod.dc1 prod.dc2
            exclude "element.type==ContainerInstance"
            autoLayout lr
        }

        deployment vrata "Produkcija" "C4-Namestitev-Lokacija" "Podrobna namestitev na eni lokaciji (rezervna lokacija je enaka)" {
            include prod.dc1
            autoLayout lr
        }

        dynamic vrata "D1-UIL-lokalna-eFTI-Platform" "PU-CA-1 / PU-G2P-1: dostop prek UIL, eFTI Platform na slovenskem eFTI Gate (TGD §3.3.1 a, c)" {
            organi -> vrata.caApi "Zahteva z UIL in pravicami obdelave"
            vrata.caApi -> vrata.gateService "Predaja (ID zahteve vrnjen organu)"
            vrata.gateService -> vrata.mq "Asinhrona obdelava"
            vrata.gateService -> vrata.ap "Zahteva za eFTI dataset"
            vrata.ap -> platformaSI "#2 G2P (eFTI Platform odgovori v 50 s)"
            platformaSI -> vrata.ap "Odgovor s podsklopi po pravicah"
            vrata.ap -> vrata.gateService "Dostava odgovora"
            vrata.gateService -> vrata.db "Shrani odgovor"
            organi -> vrata.caApi "Pridobi odgovor (≤ 60 s ali »ni odgovora«)"
            autoLayout lr
        }

        dynamic vrata "D2-UIL-tuji-eFTI-Gate" "PU-CA-1 / PU-G2G-1: dostop prek UIL, eFTI Platform na tujem eFTI Gate (TGD §3.3.1 b)" {
            organi -> vrata.caApi "Zahteva z UIL"
            vrata.caApi -> vrata.gateService "Predaja"
            vrata.gateService -> vrata.ap "UIL kaže na drug eFTI Gate"
            vrata.ap -> tujaVrata "#1 G2G zahteva (statično odkrivanje)"
            tujaVrata -> tujePlatforme "#2 G2P"
            tujaVrata -> vrata.ap "Odgovor po isti poti"
            vrata.ap -> vrata.gateService "Preveri ključ eFTI Gate, dostavi"
            organi -> vrata.caApi "Pridobi odgovor"
            autoLayout lr
        }

        dynamic vrata.gateService "D3-Iskanje-po-identifikatorjih" "PU-CA-2/3, PU-G2G-3: iskanje po identifikatorjih (TGD §3.3.2–3.3.3, §6)" {
            vrata.caApi -> vrata.gateService.jedro "Iskanje (npr. registrska oznaka)"
            vrata.gateService.jedro -> vrata.gateService.iskalnik "Išči"
            vrata.gateService.iskalnik -> vrata.gateService.roi "Lokalni zadetki"
            vrata.gateService.iskalnik -> vrata.gateService.registri "Seznam eFTI Gate"
            vrata.gateService.iskalnik -> vrata.gateService.edeliveryConnector "Posreduj iskanje vsem eFTI Gate"
            vrata.gateService.edeliveryConnector -> vrata.gateService.wsPlugin "Pošlji"
            vrata.gateService.wsPlugin -> vrata.ap "#1 G2G iskanje"
            vrata.ap -> vrata.gateService.edeliveryConnector "Delni rezultati drugih eFTI Gate"
            vrata.gateService.jedro -> vrata.db "Asinhrono: sprotni rezultati; sinhrono: združeni s statusi"
            autoLayout lr
        }

        dynamic vrata.gateService "D4-Nalaganje-identifikatorjev" "PU-P2G-1/2: nalaganje, zamenjava in deaktivacija identifikatorjev (čl. 11; TGD §6.1)" {
            vrata.ap -> vrata.gateService.edeliveryConnector "#2 P2G nalaganje UIL in identifikatorjev"
            vrata.gateService.edeliveryConnector -> vrata.gateService.jedro "Predaja"
            vrata.gateService.jedro -> vrata.gateService.certCheck "eFTI Platform v registru, status veljaven?"
            vrata.gateService.certCheck -> vrata.gateService.registri "Registry of eFTI Platforms"
            vrata.gateService.jedro -> vrata.gateService.commons "Celoten nabor veljaven? (sicer zavrni vse)"
            vrata.gateService.jedro -> vrata.gateService.iskalnik "Shrani"
            vrata.gateService.iskalnik -> vrata.gateService.roi "Dodaj ali zamenjaj; ob eFTI188 deaktiviraj (cestni prevoz: po obdobju kabotaže)"
            vrata.gateService.roi -> vrata.db "Zapis"
            vrata.gateService.jedro -> vrata.gateService.logger "Revizijska sled"
            autoLayout lr
        }

        dynamic vrata "D5-Nadaljnje-ukrepanje" "PU-CA-4 / PU-G2P-2: follow-up communication (TGD §3.3.4)" {
            organi -> vrata.caApi "Sporočilo z UIL in ID izvorne zahteve"
            vrata.caApi -> vrata.gateService "Predaja"
            vrata.gateService -> vrata.ap "Posreduj"
            vrata.ap -> platformaSI "#2 G2P follow-up communication"
            platformaSI -> vrata.ap "Potrdilo o prejemu in shranitvi"
            vrata.ap -> vrata.gateService "Dostava potrdila"
            organi -> vrata.caApi "Pridobi potrdilo"
            autoLayout lr
        }

        styles {
            element "Element" {
                color #ffffff
            }
            element "Person" {
                background #08427b
                shape Person
            }
            element "Software System" {
                background #1168bd
            }
            element "Container" {
                background #438dd5
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Zunanji" {
                background #8a8a8a
                color #ffffff
            }
            element "Test" {
                background #b8860b
            }
            element "Database" {
                shape Cylinder
            }
            element "Deployment Node" {
                background #ffffff
                color #000000
            }
            element "API" {
                shape Hexagon
            }
            element "Queue" {
                shape Pipe
            }
            element "Dodatek SI" {
                background #2e8b57
                color #ffffff
            }
            element "Odprto" {
                background #e67e22
                color #ffffff
            }
            element "R2" {
                background #8e44ad
                color #ffffff
            }
        }
    }
}
