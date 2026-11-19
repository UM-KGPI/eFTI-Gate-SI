/*
 * Slovenska eFTI-vrata – model C4 (osnutek)
 * Vir resnice za diagrame v Prilogi D in poglavju 5 TS (M3).
 *
 * Oznake elementov:
 *   "RI"        – element obstaja v referenčni implementaciji eFTI4EU/eFTI4LIVE (github.com/EFTI4EU/reference-implementation)
 *   "Dodatek SI" – ni v RI; zahteva ga produkcijska uporaba ali slovenski kontekst
 *   "Odprto"     – umestitev ali obseg še ni odločen (odvisno od M2 ali EU specifikacij)
 *
 * Številke vmesnikov #1–#7 sledijo ICD v0.5 §3.1 (eFTI4LIVE TG1.6, predstavljeno v Pragi 19. 11. 2026).
 */
workspace "Slovenska eFTI-vrata" "Model C4 za projektno nalogo M3 (pogodba C2430-26-100042)" {

    !identifiers hierarchical

    model {
        properties {
            "structurizr.groupSeparator" "/"
        }

        # ---------- Osebe ----------
        uradnik = person "Uradna oseba pristojnega organa" "Policist, inšpektor ali carinik, ki med nadzorom zahteva podatke eFTI." "Zunanji"
        operater = person "Upravljavec eFTI-vrat" "Skrbnik sistema pri MZIE ali izvajalcu vzdrževanja; nacionalna podpora (raven 2)."
        gospodarskiSubjekt = person "Gospodarski subjekt" "Prevoznik, špediter, pošiljatelj ali prejemnik, ki podatke eFTI vodi na certificirani platformi." "Zunanji"

        # ---------- Sistemi ----------
        group "Slovenija" {
            vrata = softwareSystem "Slovenska eFTI-vrata" "Nacionalna eFTI-vrata: posredujejo zahteve pristojnih organov platformam in tujim vratom, vodijo register identifikatorjev (IU 2024/1942)." {

                gateService = container "Storitev eFTI-vrat (Gate Service)" "Jedro vrat: vmesniki, avtentikacija, obdelava zahtev, poteki, povezave na zunanje sisteme. V RI ena storitev, sestavljena iz knjižnic." "Java 21+, Spring Boot" "RI" {
                    jedro = component "Jedro vrat (Gate Core)" "Vstopna točka za vse zunanje sisteme; poteki za dostop prek UIL, iskanje po identifikatorjih in nadaljnjo komunikacijo." "Spring Boot" "RI"
                    roi = component "Register identifikatorjev (RoI)" "Hrani identifikatorje, ki jih naložijo slovenske platforme, in odgovarja na iskanja (TGD1 §6)." "Java knjižnica" "RI"
                    edeliveryConnector = component "Povezovalnik eDelivery" "Abstrakcija komunikacije z dostopno točko AS4." "Java knjižnica" "RI"
                    wsPlugin = component "Odjemalec WS (WS Plugin)" "SOAP odjemalec za Domibus WS plugin." "Java knjižnica, SOAP" "RI"
                    logger = component "Dnevnik (Gate Logger)" "Tehnični dnevniki, revizijska sled, statistika v formatu JSON (TGD1 §9)." "Java knjižnica" "RI"
                    commons = component "Skupna knjižnica" "Skupni modeli, pretvorbe XSD, pripomočki." "Java knjižnica" "RI"
                    certCheck = component "Preverjanje certifikacije platform" "Lokalna kopija Unijskega referenčnega seznama, dnevna sinhronizacija; zavrne zahteve do neveljavnih platform (AG Union Registry, Level 1)." "" "Dodatek SI,Odprto"
                }

                caApi = container "API za pristojne organe" "REST vmesnik za AAP (#3); asinhron: organ prejme ID zahteve in periodično preverja odgovor. V RI del Gate Service." "REST/JSON, OIDC" "RI"
                mq = container "Sporočilni posrednik" "Vrsta asinhronih zahtev pristojnih organov." "RabbitMQ" "RI,Queue"
                db = container "Podatkovna baza vrat" "Register identifikatorjev (trajno) in stanje zahtev." "PostgreSQL" "RI,Database"
                ap = container "Dostopna točka eDelivery" "AS4 dostopna točka za #1 (vrata–vrata) in #2 (vrata–platforma); PMode po TGD Annex 1." "Domibus (EK), AS4" "RI"
                apDb = container "Baza dostopne točke" "Sporočila in konfiguracija Domibus." "MariaDB" "RI,Database"
                idp = container "Strežnik identitet in avtorizacije" "OIDC/OAuth2; v RI le primer (Keycloak). V SI federacija z nacionalnimi gradniki in Avtorizacijski register (TGD1 §5)." "OIDC (npr. Keycloak)" "RI,Dodatek SI"
                admin = container "Upravljavska aplikacija" "Upravljanje priključenih platform, certifikatov, konfiguracije in pregled dnevnikov (TS 7.6)." "Spletna aplikacija" "Dodatek SI"
                monitoring = container "Nadzor delovanja in zbiranje dnevnikov" "Zbiranje dnevnikov, metrike, alarmi, varnostni dogodki (SIEM). Izven obsega RI." "" "Dodatek SI"
            }

            aap = softwareSystem "Aplikacije pristojnih organov (AAP/UAP)" "Authority Access Point in uporabniške aplikacije Policije, FURS, IRSI in drugih organov. Obseg ločenega JN odprt (M2)." "Odprto"
            platformaSI = softwareSystem "Certificirane eFTI-platforme (SI)" "Platforme gospodarskih subjektov, priključene na slovenska vrata (npr. pilot Trinet)." "Zunanji"
            siGradniki = softwareSystem "Nacionalni gradniki e-identitete" "SI-PASS, SI-CAS, SIGEN-CA (MJU/MDP)." "Zunanji"
        }

        group "EU eFTI okolje" {
            tujaVrata = softwareSystem "Tuja eFTI-vrata" "eFTI-vrata drugih držav članic (mrežna topologija)." "Zunanji"
            referencniSeznam = softwareSystem "Unijski referenčni seznam certificiranih platform" "Seznam statusov certifikatov eFTI-platform; nacionalni vnosi pri imenovanem organu (DU o certificiranju, v sprejemanju)." "Zunanji,Odprto"
            smlSmp = softwareSystem "eDelivery SML/SMP" "Dinamično odkrivanje udeležencev za #2 (vrata–platforma)." "Zunanji,Odprto"
            tujePlatforme = softwareSystem "eFTI-platforme v drugih DČ" "Platforme, priključene na tuja vrata." "Zunanji"
        }

        group "Testno okolje (eFTI4LIVE)" {
            ri = softwareSystem "Referenčna vrata (RI) in Launchpad" "Referenčna implementacija kot sidro skladnosti v integracijskem omrežju; Launchpad: TCT in varnostni testi s podpisanim poročilom." "Zunanji,Test"
        }

        # ---------- Odnosi: kontekst ----------
        uradnik -> aap "Zahteva podatke eFTI med nadzorom"
        gospodarskiSubjekt -> platformaSI "Vodi podatke eFTI"
        operater -> vrata.admin "Upravlja vrata"

        aap -> vrata.caApi "#3 G2A: dostop prek UIL, iskanje po identifikatorjih, nadaljnja komunikacija" "REST/JSON, nacionalna izbira"
        vrata.ap -> platformaSI "#2 G2P: zahteve za nabore podatkov" "AS4 (+ REST kot nacionalna možnost)"
        platformaSI -> vrata.ap "#2 P2G: nalaganje identifikatorjev, odgovori" "AS4"
        vrata.ap -> tujaVrata "#1 G2G: posredovanje zahtev in iskanj" "AS4, statično odkrivanje"
        tujaVrata -> vrata.ap "#1 G2G: zahteve tujih organov" "AS4"
        tujaVrata -> tujePlatforme "#2 G2P" "AS4"
        vrata.ap -> smlSmp "Odkrivanje platform" "SML/SMP"
        vrata.gateService.certCheck -> referencniSeznam "Dnevni prenos statusov certifikatov" "HTTPS"
        vrata.idp -> siGradniki "Federacija identitet uradnih oseb" "SAML/OIDC"
        vrata.ap -> ri "Testi skladnosti pred vstopom v mrežo" "AS4"

        # ---------- Odnosi: vsebniki ----------
        vrata.caApi -> vrata.gateService.jedro "Predaja zahtev"
        vrata.caApi -> vrata.idp "Preverjanje žetonov in pravic"
        vrata.gateService.jedro -> vrata.mq "Vpis in obdelava asinhronih zahtev" "AMQP"
        vrata.gateService.jedro -> vrata.gateService.roi "Lokalno iskanje identifikatorjev"
        vrata.gateService.jedro -> vrata.gateService.certCheck "Preveri status platforme"
        vrata.gateService.jedro -> vrata.gateService.edeliveryConnector "Pošiljanje in prejem sporočil"
        vrata.gateService.jedro -> vrata.gateService.logger "Revizijska sled"
        vrata.gateService.jedro -> vrata.gateService.commons "Uporablja"
        vrata.gateService.roi -> vrata.db "Bere in piše identifikatorje" "JDBC"
        vrata.gateService.jedro -> vrata.db "Stanje zahtev" "JDBC"
        vrata.gateService.edeliveryConnector -> vrata.gateService.wsPlugin "Uporablja"
        vrata.gateService.wsPlugin -> vrata.ap "Pošiljanje/prejem sporočil AS4" "SOAP/HTTPS"
        vrata.ap -> vrata.apDb "Shranjuje sporočila" "JDBC"
        vrata.gateService.logger -> vrata.monitoring "Dnevniki JSON"
        vrata.admin -> vrata.gateService "Konfiguracija, priključene platforme"
        vrata.admin -> vrata.idp "Prijava upravljavcev"
        vrata.monitoring -> operater "Alarmi"
    }

    views {
        systemContext vrata "C1-Kontekst" "Raven 1: kontekst slovenskih eFTI-vrat" {
            include *
            include uradnik gospodarskiSubjekt tujePlatforme
            autoLayout lr
        }

        container vrata "C2-Vsebniki" "Raven 2: vsebniki slovenskih eFTI-vrat (izhodišče RI)" {
            include *
            autoLayout lr
        }

        component vrata.gateService "C3-Komponente-GateService" "Raven 3: komponente storitve eFTI-vrat" {
            include *
            autoLayout lr
        }

        dynamic vrata "UC1-Dostop-prek-UIL" "TGD1 §3.3.1: neposreden dostop do nabora podatkov prek UIL (lokalna platforma)" {
            aap -> vrata.caApi "Zahteva z UIL"
            vrata.caApi -> vrata.idp "Preveri žeton in pravice"
            vrata.caApi -> vrata.gateService "Predaja zahteve"
            vrata.gateService -> vrata.mq "Asinhrona obdelava"
            vrata.gateService -> vrata.ap "Zahteva za nabor (FTI)"
            vrata.ap -> platformaSI "#2 G2P zahteva"
            platformaSI -> vrata.ap "Odgovor z naborom (≤ 50 s)"
            vrata.gateService -> vrata.db "Shrani odgovor"
            aap -> vrata.caApi "Preverjanje odgovora (polling)"
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
                background #999999
            }
            element "Test" {
                background #b8860b
            }
            element "Database" {
                shape Cylinder
            }
            element "Queue" {
                shape Pipe
            }
            element "Dodatek SI" {
                stroke #c0392b
                strokeWidth 4
            }
            element "Odprto" {
                border dashed
            }
        }
    }
}
