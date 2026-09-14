# API

The backend serves both the mobile app and the dashboard. Routes live under
`backend/src/api/` and are grouped by domain:

- `auth.rs` / `auth_middleware.rs` — authentication (Privy social login) and
  protected-route middleware.
- `user.rs` — user profiles, username registration, wallet recovery.
- `feed.rs` — the social payments feed (likes, comments, shares).
- `yield.rs` — savings vaults and APY projections.
- `admin.rs` — operator and administrative endpoints.
- `mod.rs` — router assembly.

## Transport & Formats

- Base URL: `https://<host>/api` (see `docker-compose.yml` and workflows).
- Format: JSON over HTTP(S); multipart for uploads.
- OpenAPI: `backend/docs/openapi.yaml`.

## Authentication

Authenticated routes require a valid session token (Privy-derived). The auth
middleware verifies the token and attaches the resolved user context to the
request. Admin routes additionally enforce operator roles.

## Rate Limiting & Geo Guards

- Rate limiting is enforced per client IP with a Redis-backed store
  (`RateLimitStore`).
- Geo restriction middleware blocks requests from disallowed regions
  (`GeoGuardConfig`, `CountryResolver`).

## Key Endpoints

| Area        | Method | Path                     | Purpose                            |
| ----------- | ------ | ------------------------ | ---------------------------------- |
| Auth        | POST   | `/api/auth/...`          | Social login, session tokens.     |
| Users       | GET    | `/api/users/me`          | Current user profile.             |
| Users       | POST   | `/api/users/username`    | Register a username.               |
| Feed        | GET    | `/api/feed`              | Social payments feed.             |
| Feed        | POST   | `/api/feed/:id/comment`  | Comment on a payment.             |
| Feed        | POST   | `/api/feed/:id/like`     | Like a payment.                    |
| Yield       | GET    | `/api/yield/vaults`      | List vaults + projected APY.       |
| Yield       | POST   | `/api/yield/vaults/:id/deposit` | Open a vault deposit.      |
| Admin       | GET    | `/api/admin/auto`        | Administrative statistics.         |
| Admin       | POST   | `/api/admin/auto`        | Administrative actions.            |

## Disbursements

`backend/src/services/disbursement_worker.rs` handles scheduled payouts
(e.g. batch disbursements exposed via the dashboard's CSV flow). See
`backend/migrations/20260725000000_payout_batches.sql` for the persistence
model.

## Errors

Errors follow the pattern: HTTP status codes with a JSON body describing the
error. Timeouts and retriable failures are surfaced to the client where
applicable (used by the mobile offline queue).

See `backend/docs/openapi.yaml` for machine-readable definitions.