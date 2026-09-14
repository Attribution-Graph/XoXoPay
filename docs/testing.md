# Testing

Each component has its own test strategy. Run each layer's tests from its own
directory.

## Backend (`backend/`)

```bash
cd backend
cargo test --all-features
```

Covers:

- API behaviour with mocked auth and in-memory stores
  (`tests/api_tests.rs`, `tests/privy_auth_*.rs`).
- Middleware: rate limiting and geo restriction
  (`tests/middleware_tests.rs`).
- Feed integration including event parsing (`tests/feed_integration.rs`).
- Yield vault API tests (`tests/yield_api_tests.rs`).
- Inactivity watchdog sweeps against real Postgres — these require
  `WATCHDOG_TEST_DATABASE_URL` and skip without it
  (`tests/inactivity_watchdog_db_test.rs`).

The CI workflow (`ci-backend.yml`) runs formatting, clippy, and the test
suite. Clippy runs with `-D warnings`.

## Contracts (`contracts/`)

```bash
cd contracts
cargo test
```

Includes snapshot-based tests for social graph flows (e.g. mutual friendship
acceptance) and payment validation rules. See `docs/contracts.md`.

## Mobile App (`mobileapp/`)

```bash
cd mobileapp
npm test
```

Core coverage:

- API service with offline queue fallback (`api.test.ts`).
- Contacts, usernames, and transfer flows.
- NFC tap-to-pay and SDP deep-link parsing.
- Avatar rendering, theme provider, batch receipt export.
- Privy social login and wallet recovery.

Also includes Detox/E2E config (`.detoxrc.json`) for device-level flows.

## Dashboard (`dashboard/`)

Playwright-based E2E specs (`dashboard/e2e/`):

- Auth guards (role-based route protection).
- CSV disbursement upload.
- Mobile nav behaviour.

## CI

GitHub Actions workflows:

- `ci.yml` — mobile (lint, format, test, build check), backend (lint, test,
  build), contracts.
- `ci-backend.yml` — focused backend CI (fmt, clippy, test) with Postgres.
- `ci-contracts.yml` — contracts build + tests.
- `e2e.yml` — E2E suites.
- `security.yml` — Gitleaks secret scanning.

## Writing Tests

- Backend and contracts: follow existing `#[cfg(test)]` / `tests/` patterns.
- Mobile: place tests next to or under `__tests__/` matching the module under
  test.
- Dashboard: add Playwright specs under `dashboard/e2e/`.