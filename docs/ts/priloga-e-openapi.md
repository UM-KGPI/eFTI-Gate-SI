# Priloga E: Storitve OpenAPI

> **Generirano** s `scripts/build-api-docs.py` iz `interfaces/openapi/*.yaml`; ne urejaj ročno. Specifikacije so osnutki in del TS (pogl. 7.9); pri razlikah velja datoteka YAML.

## E.0 Pregled storitev

| Storitev | Datoteka | Različica | Vmesnik | Odjemalci | Izdaja | Varnost | Element C4 | Operacij |
|---|---|---|---|---|---|---|---|---|
| eFTI Authorisation Registry API | `efti-authorisation-registry-api.yaml` | 0.1.0-draft.1 | Authorisation Registry | kadrovski sistemi pristojnih organov | R2, pogojno (M2) | mTLS + OAuth 2.0 (client credentials) | `gate.arApi` | 4 |
| eFTI Gate AAP API | `efti-gate-aap-api.yaml` | 1.0.0-draft.1 | #3 G2A | AAP pristojnih organov | R1 | mTLS + OAuth 2.0 (client credentials) | `gate.aapApi` | 6 |
| eFTI Gate Administration API | `efti-gate-admin-api.yaml` | 1.0.0-draft.1 | upravljanje | upravljavska aplikacija, avtomatizacija MZIE | R1 (sinhronizacija statusov R2) | mTLS + OpenID Connect | `gate.adminApi` | 17 |
| eFTI Gate Audit and Statistics API | `efti-gate-audit-api.yaml` | 1.0.0-draft.1 | revizija, poročanje | upravljavska aplikacija, poročanje MZIE | R1 | mTLS + OpenID Connect | `gate.auditApi` | 5 |

Vmesnik #2 (eFTI Gate ↔ eFTI Platform) je na ravni EU določen z eDelivery (AS4); profil REST je nacionalna možnost (čl. 9(4) IU 2024/1942, ICD v0.5 §9) in se tu ne specificira, dokler o njem ne odloči MZIE (SI-GATE-FR-134, SI-GATE-FR-306).

## eFTI Authorisation Registry API

Maintenance of officers' access and processing rights (release R2, conditional on M2).

Osnovna pot: `/authorisation/v1` · varnost: mTLS + OAuth 2.0 (client credentials) · izdaja: R2, pogojno (M2) · datoteka: `interfaces/openapi/efti-authorisation-registry-api.yaml`

| Metoda | Pot | operationId | Opis | Odgovori |
|---|---|---|---|---|
| GET | `/officers/{officerReference}` | `getOfficerRights` | Get the current rights of an officer | 200, 401, 404 |
| PUT | `/officers/{officerReference}` | `setOfficerRights` | Create or replace the rights of an officer | 200, 400, 401 |
| DELETE | `/officers/{officerReference}` | `revokeOfficerRights` | Revoke all rights of an officer | 204, 401, 404 |
| GET | `/officers/{officerReference}/history` | `getOfficerRightsHistory` | Change history of an officer's rights (Art. 5(d)) | 200, 401, 404 |

## eFTI Gate AAP API

Interface #3 (G2A) between the Slovenian eFTI Gate and Authority Access Points (AAP).

Osnovna pot: `/v1` · varnost: mTLS + OAuth 2.0 (client credentials) · izdaja: R1 · datoteka: `interfaces/openapi/efti-gate-aap-api.yaml`

| Metoda | Pot | operationId | Opis | Odgovori |
|---|---|---|---|---|
| GET | `/aap/control/uil` | `getUilResult` | Get the result of an eFTI data request | 200, 401, 404 |
| POST | `/aap/control/uil` | `submitUilRequest` | Submit an eFTI data request by UIL | 202, 400, 401, 403, 429 |
| GET | `/aap/control/identifiers` | `getIdentifiersResult` | Get (partial or consolidated) search results | 200, 401, 404 |
| POST | `/aap/control/identifiers` | `submitIdentifiersSearch` | Submit a search in the Registry of Identifiers | 202, 400, 401, 403, 429 |
| GET | `/aap/control/uil/follow-up` | `getFollowUpResult` | Get the processing status of a follow-up communication | 200, 401, 404 |
| POST | `/aap/control/uil/follow-up` | `submitFollowUp` | Submit a follow-up communication | 202, 400, 401, 403, 404 |

## eFTI Gate Administration API

Management of connection registries, eFTI Platform onboarding and shared configuration.

Osnovna pot: `/admin/v1` · varnost: mTLS + OpenID Connect · izdaja: R1 (sinhronizacija statusov R2) · datoteka: `interfaces/openapi/efti-gate-admin-api.yaml`

| Metoda | Pot | operationId | Opis | Odgovori |
|---|---|---|---|---|
| GET | `/gates` | `listGates` | List registered eFTI Gates | 200, 401 |
| POST | `/gates` | `registerGate` | Register an eFTI Gate and its security certificate | 201, 400, 401, 409 |
| GET | `/gates/{gateId}` | `getGate` | Get an eFTI Gate | 200, 401, 404 |
| PUT | `/gates/{gateId}` | `updateGate` | Update endpoint, certificate or status of an eFTI Gate | 200, 400, 401, 404 |
| GET | `/aaps` | `listAaps` | List registered AAPs | 200, 401 |
| POST | `/aaps` | `registerAap` | Register an AAP and its security certificate (IU Art. 6(3)(d)) | 201, 400, 401, 409 |
| PUT | `/aaps/{aapId}` | `updateAap` | Update certificate or status of an AAP | 200, 401, 404 |
| GET | `/platforms` | `listPlatforms` | List the Registry of eFTI Platforms | 200, 401 |
| POST | `/platforms` | `onboardPlatform` | Onboard an eFTI Platform (TS SI-GATE-NFR-280) | 201, 400, 401, 409 |
| GET | `/platforms/{platformId}` | `getPlatform` | Get an eFTI Platform | 200, 401, 404 |
| PUT | `/platforms/{platformId}` | `updatePlatform` | Update keys, certification status or connection policy | 200, 400, 401, 404 |
| PUT | `/platforms/{platformId}/suspension` | `suspendPlatform` | Temporarily disconnect an eFTI Platform (TS SI-GATE-NFR-283) | 204, 401, 404 |
| DELETE | `/platforms/{platformId}/suspension` | `resumePlatform` | Lift the suspension of an eFTI Platform | 204, 401, 404 |
| GET | `/code-lists/{codeListId}` | `getCodeList` | Get a shared code list | 200, 401, 404 |
| PUT | `/code-lists/{codeListId}` | `updateCodeList` | Replace a shared code list without code changes (IU Art. 6(3)(g)) | 200, 400, 401 |
| GET | `/certification/sync` | `getCertificationSync` | Status of the last synchronisation (R2) | 200, 401 |
| POST | `/certification/sync` | `syncCertificationStatus` | Synchronise certification status with the Union Reference List (R2) | 202, 401 |

## eFTI Gate Audit and Statistics API

Read access to the audit trail and statistics of the Slovenian eFTI Gate.

Osnovna pot: `/audit/v1` · varnost: mTLS + OpenID Connect · izdaja: R1 · datoteka: `interfaces/openapi/efti-gate-audit-api.yaml`

| Metoda | Pot | operationId | Opis | Odgovori |
|---|---|---|---|---|
| GET | `/requests` | `searchAuditRecords` | Search audit records | 200, 401 |
| GET | `/requests/{requestId}` | `getAuditTrail` | Full audit trail of one request (request, forwarding, responses, timeouts) | 200, 401, 404 |
| POST | `/exports` | `createExport` | Create a human-readable export for a competent authority | 202, 400, 401 |
| GET | `/exports/{exportId}` | `getExport` | Get the status and download link of an export | 200, 401, 404 |
| GET | `/statistics/annual/{year}` | `getAnnualStatistics` | Annual number of eFTI data requests (Art. 17 of Regulation (EU) 2020/1056) | 200, 401 |
