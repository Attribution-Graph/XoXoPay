# Development

This guide covers setting up a local development environment for XoXoPay.

## Prerequisites

- Node.js 18+ (`.nvmrc`)
- Rust stable — see `backend/rust-toolchain.toml`
- `wasm32-unknown-unknown` target for contracts
- Postgres 15 and Redis 7 (or `docker-compose up -d`)
- Expo tooling for the mobile app

## Repository Layout

| Path           | Stack                          | Purpose                              |
| -------------- | ------------------------------ | ------------------------------------ |
| `mobileapp/`   | React Native + Expo            | Customer mobile app                   |
| `backend/`     | Rust, Axum, sqlx, Redis        | API server + Stellar indexer          |
| `contracts/`   | Rust, Soroban (WASM)           | Smart contracts workspace             |
| `dashboard/`   | Next.js                        | Operator dashboard                    |
| `marketing/`   | Next.js                        | Marketing/public pages                |
| `scripts/`     | Python/shell                   | Tooling (issue generation, etc.)      |
| `k8s/`         | Kubernetes manifests           | Deployment definitions                 |

## Local Services

Start ancillary services:

```bash
docker-compose up -d postgres redis
```

Relevant connections:

- Postgres: `xoxopay_dev` database (see `docker-compose.yml`).
- Redis: `localhost:6379`.
- Soroban RPC: `stellar/quickstart` container for contract development.

## Backend

```bash
cd backend
cargo run
```

Before changes:

```bash
cargo fmt
cargo clippy --all-targets --all-features -- -D warnings
cargo test --all-features
```

## Mobile App

```bash
cd mobileapp
npm install
npm start
```

Run tests:

```bash
npm test
```

## Contracts

```bash
cd contracts
cargo build --target wasm32-unknown-unknown --release
cargo test
```

## Environment Variables

Key variables (do not commit real values):

- `DATABASE_URL` — backend Postgres connection.
- `WATCHDOG_TEST_DATABASE_URL` — throwaway DB for watchdog integration tests.
- Third-party secrets (Privy, Stellar/RPC keys, bridge keys) — see
  `.env.example` files per layer where present.

## Code Style

- Rust: rustfmt (`cargo fmt`) and clippy clean.
- TypeScript/JS: Prettier (`.prettierrc.json`, `.prettierignore`).
- Commits: Conventional Commits (see `CONTRIBUTING.md`).

## Common Tasks

| Task                                   | Command                          |
| -------------------------------------- | -------------------------------- |
| Run full backend checks                | `cargo fmt && cargo clippy && cargo test` |
| Build contracts for deployment         | `cargo build --target wasm32-unknown-unknown --release` |
| Lint mobile app                        | `cd mobileapp && npm run lint`   |
| Format mobile/dashboard code           | `npx prettier --write .`          |
| Regenerate issue tracking docs         | `python3 scripts/generate_and_publish_issues.py` |