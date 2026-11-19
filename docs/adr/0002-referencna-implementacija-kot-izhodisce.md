# ADR-0002: Referenčna implementacija eFTI-vrat kot izhodišče arhitekture

- **Status:** predlog (potrditev po M2 in z MZIE)
- **Datum:** 2026-11-19
- **Povezave:** TS pogl. 5, 7, 9, 10; Priloga D

## Kontekst

- Referenčna implementacija (RI) eFTI-vrat je odprtokodna (Apache-2.0, Java), [github.com/EFTI4EU/reference-implementation](https://github.com/EFTI4EU/reference-implementation). Razvita v eFTI4EU, od v0.9 jo vzdržuje eFTI4LIVE TG2.2 (DE, EE).
- RI ima tri vloge (Praga, 19. 11. 2026, TG2.2): (1) izhodiščna koda za države članice, (2) trajno nameščena v integracijskem omrežju kot **sidro skladnosti** – vsaka vrata se pred priklopom v mrežo testirajo proti RI, (3) peskovnik v **Launchpadu** (TCT in varnostni testi s podpisanim poročilom).
- README RI izrecno navaja: RI **ni namenjena produkciji**; države jo morajo prilagoditi nacionalnim zahtevam.
- Zgradba RI: ena storitev (Spring Boot), sestavljena iz knjižnic (Gate Core, Register identifikatorjev, eDelivery povezovalnik, WS plugin, Logger, Commons); odvisnosti PostgreSQL, RabbitMQ, Keycloak (le primer), Domibus (+ MariaDB, ActiveMQ). D2.2 jo opisuje kot "microservices"; koda tega ne potrjuje.
- Načrt izdaj (TG2.2): v0.9 nov. 2026 (na GitHubu 19. 11. 2026 označena le v0.5.0), posodobitve XSD mar. 2027, SML/SMP apr.–maj 2027, v0.97 ~apr. 2027, v1.x ~maj 2027, Launchpad feb.–jun. 2027.

## Odločitev (predlog)

TS dovoli in priporoči gradnjo na RI, a zahteve postavi neodvisno od RI (tehnološko nevtralno), z jasnim seznamom produkcijskih dodatkov (Priloga D, D.2).

## Posledice

- **Prevzem:** TS zahteva uspešne teste skladnosti proti RI v integracijskem omrežju in podpisano poročilo Launchpad/TCT (pogl. 9).
- **Premična osnova:** izvajalec bo gradil med izdajami RI in XSD; TS mora zahtevati sledenje izdajam in upravljanje verzij (ICD §13) ter to upoštevati v oceni virov (pogl. 11).
- **Kritična pot:** SML/SMP (odkrivanje platform) v RI šele ~2 meseca pred produkcijo 9. 7. 2027.
- Priporočilo: slovenska ekipa sodeluje na tedenskih sestankih TG2.2 (četrtki, prvi 26. 11. 2026).
