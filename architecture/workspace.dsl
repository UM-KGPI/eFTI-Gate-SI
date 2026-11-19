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
        officer = person "Uradnik pristojnega organa" "Policist, inšpektor ali carinik, ki med nadzorom zahteva podatke eFTI (čl. 1(3) IU 2024/1942)." "Zunanji"
        operator = person "Upravljavec eFTI Gate" "Skrbnik pri MZIE ali izvajalcu vzdrževanja; nacionalna služba za pomoč (raven 2)."
        economicOperator = person "Gospodarski subjekt" "Prevoznik, špediter, pošiljatelj ali prejemnik; podatke eFTI vodi na certificirani eFTI Platform." "Zunanji"

        # ---------- Sistemi ----------
        group "Slovenija" {
            gate = softwareSystem "eFTI Gate" "Slovenski eFTI Gate (čl. 6 IU 2024/1942) z search mechanism (čl. 8) in Registry of Identifiers (čl. 11)." {
                properties {
                    "komp" "EG"
                }

                gateService = container "eFTI Gate Service" "Jedro eFTI Gate: vmesniki, obdelava zahtev, usmerjanje, revizijska sled. V RI ena storitev iz knjižnic." "Java 21+, Spring Boot" "RI" {
                    properties {
                        "komp" "EG"
                    }
                    core = component "Jedro (Gate Core)" "Obdelava zahtev prek UIL, iskanj po identifikatorjih in follow-up communication; vloga requesting eFTI Gate in receiving eFTI Gate; časovna omejitev 60 s." "Spring Boot" "RI" {
                        properties {
                            "komp" "EG"
                        }
                    }
                    searchMechanism = component "Search mechanism" "Iz UIL razbere eFTI Gate in eFTI Platform, išče v Registry of Identifiers, posreduje iskanja drugim eFTI Gate, združi rezultate (čl. 8; TGD §6.2–6.3)." "Java" "RI" {
                        properties {
                            "komp" "SM"
                        }
                    }
                    roi = component "Registry of Identifiers" "Nalaganje, zamenjava, aktivacija, deaktivacija in izbris UIL z identifikatorji; nastavljiv nabor identifikatorjev (čl. 11; TGD §6.1, 6.4)." "Java" "RI" {
                        properties {
                            "komp" "RoI"
                        }
                    }
                    registries = component "Registri povezav" "Register eFTI Gate drugih DČ (ID, certifikati), register AAP (ID, certifikati), Registry of eFTI Platforms (ID, ključi, certifikacijski status, politika priklopa) (čl. 6(3)(d)–(f))." "Java" "Dodatek SI" {
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
                    statistics = component "Statistika in metrike" "Metrike za nadzor delovanja; letna statistika dostopov za poročanje po čl. 17 Uredbe (EU) 2020/1056." "Java" "Dodatek SI" {
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

                aapApi = container "eFTI Gate AAP API (#3)" "OpenAPI: zahteve prek UIL, iskanja po identifikatorjih, follow-up communication; asinhrono (requestId). Pot /v1/aap/control/..." "REST/JSON, mTLS, OAuth 2.0" "API,RI" {
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
                adminApp = container "Upravljavska aplikacija" "Registri povezav, priklop eFTI Platform (tudi čl. 6(4)), certifikati, šifranti, pregled revizijskih sledi, statistika." "Spletna aplikacija" "Dodatek SI" {
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

            authorities = softwareSystem "Sistemi pristojnih organov (AAP, Authorisation Registry, UAP)" "AAP (čl. 4), Authorisation Registry (čl. 5) in UAP (čl. 7) Policije, FURS, IRSI in drugih organov. V eFTI Gate ali pri organih: odloči M2 (čl. 4(4))." "Odprto" {
                properties {
                    "komp" "AAP"
                }
            }
            platformsSI = softwareSystem "eFTI Platform (SI)" "eFTI Platform, certificirane v Sloveniji ali priključene po čl. 6(4)." "Zunanji"
            nationalEid = softwareSystem "Nacionalni gradniki e-identitete" "SI-PASS, SI-CAS, SIGEN-CA." "Zunanji"
            nationalPlatformList = softwareSystem "Nacionalni seznam certificiranih eFTI Platform" "Imenovani organ in organi za ugotavljanje skladnosti (akreditira Slovenska akreditacija)." "Zunanji,Odprto"
        }

        group "EU eFTI okolje" {
            foreignGates = softwareSystem "eFTI Gate drugih DČ" "Mrežna topologija eFTI Gate." "Zunanji"
            unionReferenceList = softwareSystem "Unijski referenčni seznam" "Statusi certifikatov eFTI Platform (DU o certificiranju, v sprejemanju)." "Zunanji,Odprto"
            smlSmp = softwareSystem "eDelivery SML/SMP" "Dinamično odkrivanje eFTI Platform za #2." "Zunanji"
            foreignPlatforms = softwareSystem "eFTI Platform drugih DČ" "Priključene na eFTI Gate drugih DČ." "Zunanji"
            euHelpdesk = softwareSystem "Služba za pomoč EK (raven 3)" "Čl. 12(2) IU 2024/1942." "Zunanji"
        }

        group "Testno okolje eFTI4LIVE" {
            ri = softwareSystem "Referenčni eFTI Gate (RI) in Launchpad" "Sidro skladnosti v integracijskem omrežju; TCT in varnostni testi s podpisanim poročilom." "Zunanji,Test"
        }

        # ---------- Odnosi: osebe ----------
        officer -> authorities "Vloži zahtevo za dostop ali follow-up communication"
        economicOperator -> platformsSI "Vodi podatke eFTI"
        operator -> gate.adminApp "Upravlja eFTI Gate"
        gate.monitoring -> operator "Alarmi"
        operator -> euHelpdesk "Prijave na raven 3"

        # ---------- Odnosi: zunanji ----------
        authorities -> gate.aapApi "#3 G2A: zahteve prek UIL, iskanja, follow-up communication" "REST/JSON, mTLS"
        authorities -> nationalEid "Identifikacija uradnikov" "SAML/OIDC"
        gate.ap -> platformsSI "#2 G2P: zahteve za eFTI dataset, follow-up communication" "AS4"
        platformsSI -> gate.ap "#2 P2G: nalaganje identifikatorjev, odgovori" "AS4"
        gate.ap -> foreignGates "#1 G2G: posredovanje zahtev in iskanj" "AS4, statično odkrivanje"
        foreignGates -> gate.ap "#1 G2G: zahteve in iskanja drugih DČ, odgovori" "AS4"
        foreignGates -> foreignPlatforms "#2 G2P" "AS4"
        gate.ap -> smlSmp "Odkrivanje eFTI Platform" "SML/SMP"
        gate.gateService.certCheck -> unionReferenceList "Sinhronizacija statusov certifikatov (R2)" "HTTPS"
        gate.gateService.certCheck -> nationalPlatformList "Nacionalni vnosi certificiranih eFTI Platform" "HTTPS ali ročno"
        gate.ap -> ri "Testi skladnosti pred vstopom v mrežo" "AS4"
        platformsSI -> gate.tct "Testi TCT pred priklopom (R2)" "AS4/REST"

        # ---------- Odnosi: znotraj prehoda ----------
        gate.aapApi -> gate.gateService.core "Predaja zahtev"
        gate.aapApi -> gate.idp "Preverjanje odjemalca in žetonov"
        gate.gateService.core -> gate.mq "Asinhrona obdelava" "AMQP"
        gate.gateService.core -> gate.gateService.searchMechanism "Razreši cilj, išči"
        gate.gateService.core -> gate.gateService.registries "Preveri pošiljatelja (AAP, eFTI Gate)"
        gate.gateService.core -> gate.gateService.certCheck "Preveri eFTI Platform"
        gate.gateService.core -> gate.gateService.edeliveryConnector "Pošlji in prejmi sporočila"
        gate.gateService.core -> gate.gateService.logger "Revizijska sled"
        gate.gateService.core -> gate.gateService.statistics "Dogodki"
        gate.gateService.core -> gate.gateService.commons "Validacija in modeli"
        gate.gateService.core -> gate.db "Stanje zahtev" "JDBC"
        gate.gateService.searchMechanism -> gate.gateService.roi "Lokalno iskanje"
        gate.gateService.searchMechanism -> gate.gateService.registries "eFTI Gate za posredovanje iskanj"
        gate.gateService.searchMechanism -> gate.gateService.edeliveryConnector "Iskanje v drugih eFTI Gate"
        gate.gateService.certCheck -> gate.gateService.registries "Registry of eFTI Platforms"
        gate.gateService.roi -> gate.db "Zapisi UIL in identifikatorjev" "JDBC"
        gate.gateService.registries -> gate.db "Registri povezav" "JDBC"
        gate.gateService.edeliveryConnector -> gate.gateService.wsPlugin "Uporablja"
        gate.gateService.wsPlugin -> gate.ap "Pošiljanje in prejem sporočil AS4" "SOAP/HTTPS"
        gate.ap -> gate.gateService.edeliveryConnector "Dostava prejetih sporočil" "JMS/WS"
        gate.ap -> gate.apDb "Sporočila" "JDBC"
        gate.gateService.logger -> gate.logStore "Zapisi revizijske sledi"
        gate.gateService.logger -> gate.monitoring "Tehnični in varnostni dogodki"
        gate.gateService.statistics -> gate.monitoring "Metrike"
        gate.adminApp -> gate.adminApi "Upravljanje registrov, priklopa in šifrantov" "HTTPS/JSON"
        gate.adminApi -> gate.gateService.registries "Branje in pisanje registrov"
        gate.adminApi -> gate.idp "Preverjanje žetonov"
        gate.adminApp -> gate.auditApi "Revizijska sled, izvozi, statistika" "HTTPS/JSON"
        gate.auditApi -> gate.gateService.statistics "Letna statistika"
        gate.auditApi -> gate.idp "Preverjanje žetonov"
        gate.auditApi -> gate.logStore "Branje revizijskih sledi"
        operator -> gate.auditApi "Poročanje MZIE (čl. 17)" "HTTPS/JSON"
        authorities -> gate.arApi "Sinhronizacija pravic uradnikov (R2)" "REST/JSON, mTLS"
        gate.arApi -> gate.db "Pravice uradnikov" "JDBC"
        gate.adminApp -> gate.idp "Prijava upravljavcev (MFA)"
        gate.tct -> gate.gateService.registries "Rezultat TCT za priklop"

        production = deploymentEnvironment "Produkcija" {
            site1 = deploymentGroup "Lokacija 1"
            site2 = deploymentGroup "Lokacija 2"
        dc1 = deploymentNode "Podatkovni center 1 (primarna lokacija)" "Aktivna lokacija; varianta gostovanja H1/H2/H3 po M2." "Slovenija" {
            dc1Dmz = deploymentNode "Cona DMZ" "Vstopna točka in eDelivery." "Požarni zid, WAF" {
                dc1Waf = infrastructureNode "Vstopna točka (reverse proxy, API gateway, WAF)" "TLS 1.2+, mTLS, omejevanje hitrosti (2 VM)." "" "Dodatek SI"
                deploymentNode "eDelivery Access Point" "" "VM, 2 × 4 vCPU / 8 GB" "" 2 {
                    containerInstance gate.ap site1
                }
            }
            dc1App = deploymentNode "Aplikacijska cona" "" "Virtualizacija ali gruča vsebnikov" {
                deploymentNode "eFTI Gate Service" "" "VM ali pod, 3 × 4 vCPU / 8 GB" "" 3 {
                    containerInstance gate.gateService site1
                    containerInstance gate.aapApi site1
                }
                deploymentNode "Storitve upravljanja" "" "VM ali pod, 2 × 2 vCPU / 4 GB" "" 2 {
                    containerInstance gate.adminApi site1
                    containerInstance gate.auditApi site1
                    containerInstance gate.adminApp site1
                }
                deploymentNode "Strežnik identitet" "" "VM ali pod, 2 × 2 vCPU / 4 GB" "" 2 {
                    containerInstance gate.idp site1
                }
                deploymentNode "Sporočilni posrednik" "" "gruča, 3 × 2 vCPU / 4 GB" "" 3 {
                    containerInstance gate.mq site1
                }
            }
            dc1Data = deploymentNode "Podatkovna cona" "" "šifrirana shramba" {
                deploymentNode "PostgreSQL" "" "primarna + replika, 4 vCPU / 16 GB / 250 GB" "" 2 {
                    containerInstance gate.db site1
                }
                deploymentNode "MariaDB" "" "primarna + replika, 4 vCPU / 16 GB / 250 GB" "" 2 {
                    containerInstance gate.apDb site1
                }
                deploymentNode "Objektna shramba WORM" "" "≥ 1 TB" {
                    containerInstance gate.logStore site1
                }
            }
            dc1Mgmt = deploymentNode "Upravljalna cona" "" "dostop le prek bastiona" {
                deploymentNode "Nadzor in dnevniki" "" "2 × 4 vCPU / 16 GB / 500 GB" "" 2 {
                    containerInstance gate.monitoring site1
                }
                dc1Bastion = infrastructureNode "Bastion" "Upravljalni dostop z MFA." "" "Dodatek SI"
            }
            dc1Hsm = infrastructureNode "HSM (2 × v HA)" "Zasebni ključi eDelivery Access Point (FIPS 140-2/3 raven 3 ali CC EAL4+)." "PKCS#11" "Dodatek SI"
        }

        dc2 = deploymentNode "Podatkovni center 2 (rezervna lokacija)" "Pripravljena lokacija (aktivno-pasivno), RTO 4 h, RPO 15 min." "Slovenija" {
            dc2Dmz = deploymentNode "Cona DMZ" "Vstopna točka in eDelivery." "Požarni zid, WAF" {
                dc2Waf = infrastructureNode "Vstopna točka (reverse proxy, API gateway, WAF)" "TLS 1.2+, mTLS, omejevanje hitrosti (2 VM)." "" "Dodatek SI"
                deploymentNode "eDelivery Access Point" "" "VM, 2 × 4 vCPU / 8 GB" "" 2 {
                    containerInstance gate.ap site2
                }
            }
            dc2App = deploymentNode "Aplikacijska cona" "" "Virtualizacija ali gruča vsebnikov" {
                deploymentNode "eFTI Gate Service" "" "VM ali pod, 3 × 4 vCPU / 8 GB" "" 3 {
                    containerInstance gate.gateService site2
                    containerInstance gate.aapApi site2
                }
                deploymentNode "Storitve upravljanja" "" "VM ali pod, 2 × 2 vCPU / 4 GB" "" 2 {
                    containerInstance gate.adminApi site2
                    containerInstance gate.auditApi site2
                    containerInstance gate.adminApp site2
                }
                deploymentNode "Strežnik identitet" "" "VM ali pod, 2 × 2 vCPU / 4 GB" "" 2 {
                    containerInstance gate.idp site2
                }
                deploymentNode "Sporočilni posrednik" "" "gruča, 3 × 2 vCPU / 4 GB" "" 3 {
                    containerInstance gate.mq site2
                }
            }
            dc2Data = deploymentNode "Podatkovna cona" "" "šifrirana shramba" {
                deploymentNode "PostgreSQL" "" "primarna + replika, 4 vCPU / 16 GB / 250 GB" "" 2 {
                    containerInstance gate.db site2
                }
                deploymentNode "MariaDB" "" "primarna + replika, 4 vCPU / 16 GB / 250 GB" "" 2 {
                    containerInstance gate.apDb site2
                }
                deploymentNode "Objektna shramba WORM" "" "≥ 1 TB" {
                    containerInstance gate.logStore site2
                }
            }
            dc2Mgmt = deploymentNode "Upravljalna cona" "" "dostop le prek bastiona" {
                deploymentNode "Nadzor in dnevniki" "" "2 × 4 vCPU / 16 GB / 500 GB" "" 2 {
                    containerInstance gate.monitoring site2
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

        systemLandscape "C0-Landscape" "eFTI Gate v okolju eFTI" {
            include *
            autoLayout lr
        }

        systemContext gate "C1-Context" "Raven 1: kontekst eFTI Gate" {
            include *
            include officer economicOperator foreignPlatforms
            autoLayout lr
        }

        container gate "C2-API" "Storitve OpenAPI eFTI Gate in njihovi odjemalci (Priloga E)" {
            include gate.aapApi gate.adminApi gate.auditApi gate.arApi
            include authorities operator gate.adminApp gate.gateService gate.idp gate.logStore gate.db
            autoLayout lr
        }

        container gate "C2-Containers" "Raven 2: vsebniki eFTI Gate (izhodišče RI, dodatki SI, R2)" {
            include *
            autoLayout lr
        }

        component gate.gateService "C3-Components" "Raven 3: komponente eFTI Gate Service" {
            include *
            autoLayout lr
        }

        deployment gate "Produkcija" "C4-Deployment-Overview" "Produkcija na dveh lokacijah: cone, HSM, replikacija (pogl. 5.5)" {
            include production.dc1 production.dc2
            exclude "element.type==ContainerInstance"
            autoLayout lr
        }

        deployment gate "Produkcija" "C4-Deployment-Site" "Podrobna namestitev na eni lokaciji (rezervna lokacija je enaka)" {
            include production.dc1
            autoLayout lr
        }

        dynamic gate "D1-UIL-local-platform" "PU-CA-1 / PU-G2P-1: dostop prek UIL, eFTI Platform na slovenskem eFTI Gate (TGD §3.3.1 a, c)" {
            authorities -> gate.aapApi "Zahteva z UIL in pravicami obdelave"
            gate.aapApi -> gate.gateService "Predaja (ID zahteve vrnjen organu)"
            gate.gateService -> gate.mq "Asinhrona obdelava"
            gate.gateService -> gate.ap "Zahteva za eFTI dataset"
            gate.ap -> platformsSI "#2 G2P (eFTI Platform odgovori v 50 s)"
            platformsSI -> gate.ap "Odgovor s podsklopi po pravicah"
            gate.ap -> gate.gateService "Dostava odgovora"
            gate.gateService -> gate.db "Shrani odgovor"
            authorities -> gate.aapApi "Pridobi odgovor (≤ 60 s ali »ni odgovora«)"
            autoLayout lr
        }

        dynamic gate "D2-UIL-foreign-gate" "PU-CA-1 / PU-G2G-1: dostop prek UIL, eFTI Platform na tujem eFTI Gate (TGD §3.3.1 b)" {
            authorities -> gate.aapApi "Zahteva z UIL"
            gate.aapApi -> gate.gateService "Predaja"
            gate.gateService -> gate.ap "UIL kaže na drug eFTI Gate"
            gate.ap -> foreignGates "#1 G2G zahteva (statično odkrivanje)"
            foreignGates -> foreignPlatforms "#2 G2P"
            foreignGates -> gate.ap "Odgovor po isti poti"
            gate.ap -> gate.gateService "Preveri ključ eFTI Gate, dostavi"
            authorities -> gate.aapApi "Pridobi odgovor"
            autoLayout lr
        }

        dynamic gate.gateService "D3-Identifier-search" "PU-CA-2/3, PU-G2G-3: iskanje po identifikatorjih (TGD §3.3.2–3.3.3, §6)" {
            gate.aapApi -> gate.gateService.core "Iskanje (npr. registrska oznaka)"
            gate.gateService.core -> gate.gateService.searchMechanism "Išči"
            gate.gateService.searchMechanism -> gate.gateService.roi "Lokalni zadetki"
            gate.gateService.searchMechanism -> gate.gateService.registries "Seznam eFTI Gate"
            gate.gateService.searchMechanism -> gate.gateService.edeliveryConnector "Posreduj iskanje vsem eFTI Gate"
            gate.gateService.edeliveryConnector -> gate.gateService.wsPlugin "Pošlji"
            gate.gateService.wsPlugin -> gate.ap "#1 G2G iskanje"
            gate.ap -> gate.gateService.edeliveryConnector "Delni rezultati drugih eFTI Gate"
            gate.gateService.core -> gate.db "Asinhrono: sprotni rezultati; sinhrono: združeni s statusi"
            autoLayout lr
        }

        dynamic gate.gateService "D4-Identifier-upload" "PU-P2G-1/2: nalaganje, zamenjava in deaktivacija identifikatorjev (čl. 11; TGD §6.1)" {
            gate.ap -> gate.gateService.edeliveryConnector "#2 P2G nalaganje UIL in identifikatorjev"
            gate.gateService.edeliveryConnector -> gate.gateService.core "Predaja"
            gate.gateService.core -> gate.gateService.certCheck "eFTI Platform v registru, status veljaven?"
            gate.gateService.certCheck -> gate.gateService.registries "Registry of eFTI Platforms"
            gate.gateService.core -> gate.gateService.commons "Celoten nabor veljaven? (sicer zavrni vse)"
            gate.gateService.core -> gate.gateService.searchMechanism "Shrani"
            gate.gateService.searchMechanism -> gate.gateService.roi "Dodaj ali zamenjaj; ob eFTI188 deaktiviraj (cestni prevoz: po obdobju kabotaže)"
            gate.gateService.roi -> gate.db "Zapis"
            gate.gateService.core -> gate.gateService.logger "Revizijska sled"
            autoLayout lr
        }

        dynamic gate "D5-Follow-up" "PU-CA-4 / PU-G2P-2: follow-up communication (TGD §3.3.4)" {
            authorities -> gate.aapApi "Sporočilo z UIL in ID izvorne zahteve"
            gate.aapApi -> gate.gateService "Predaja"
            gate.gateService -> gate.ap "Posreduj"
            gate.ap -> platformsSI "#2 G2P follow-up communication"
            platformsSI -> gate.ap "Potrdilo o prejemu in shranitvi"
            gate.ap -> gate.gateService "Dostava potrdila"
            authorities -> gate.aapApi "Pridobi potrdilo"
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
