# Security

XoXoPay moves real money. The threat model treats the contracts and the
backend's mint/burn-facing paths as the highest-risk surfaces.

## Threat Model

| Asset                  | Risk                                                     |
| ---------------------- | -------------------------------------------------------- |
| Soroban contracts      | Logic bugs that mint, burn, or reorder value.            |
| Backend auth           | Session forgery, privilege escalation to admin.          |
| Wallet recovery        | Compromised mnemonics or recovery flows.                 |
| Offline queue          | Replayed or forged signed requests.                      |
| Admin dashboard        | Unauthorized operator access, CSV injection.             |
| Cross-chain bridge     | Invalid Allbridge messages minting unbacked tokens.      |

## Controls

### Backend

- **Authentication**: Privy social login; JWT-style tokens checked by
  `auth_middleware.rs`.
- **Rate limiting**: IP-based `RateLimitStore` (Redis) on sensitive routes.
- **Geo restriction**: `GeoGuardConfig + CountryResolver` block disallowed
  regions.
- **Validation**: Usernames and payment inputs validated server-side
  (`user.rs`, feed/yield endpoints). SSRF-safe URL handling in tests for
  anchor interactions.
- **Databases**: Secrets loaded from env/config, never committed. Gitleaks
  runs in CI (`security.yml`).

### Contracts

- Payment amount/balance invariants enforced on-chain.
- Social graph operations validate relationships before mutation.
- Yield vaults enforce lock duration and claim rules.
- Bridge receiver validates messages against the trusted Allbridge source
  before minting.

### Mobile App

- Mnemonic backup with verification quiz (`wallet-recovery.tsx`).
- Biometric unlock keyed to stored credentials.
- Offline queue signs and replays only intended requests.
- NFC tap-to-pay validates recipient and amount before send.
- SDP deep links (`xoxopay://`) parse strict formats (`sdpDeepLink.ts`).

### Dashboard & Marketing

- Role-based route guards (`middleware.ts`, `e2e/auth-guards.spec.ts`).
- Public pages (privacy policy, terms of service) audited separately.

## Secret Handling

- Private keys, session secrets, and third-party API keys are injected as
  environment variables at deploy time only.
- If a secret is suspected of leaking, rotate it immediately and report it
  per `SECURITY.md`.

## Nonces

A dedicated nonce mechanism guards against replay of signed requests. See
`NONCE_IMPLEMENTATION.md` at the repository root for the design.

## Registration of Vulnerabilities

Follow the private disclosure process in [SECURITY.md](../SECURITY.md).