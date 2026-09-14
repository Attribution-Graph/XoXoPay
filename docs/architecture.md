# Architecture

XoXoPay is a social payments platform on the Stellar network. It combines a
Soroban smart-contract layer (on-chain state) with a Rust backend that
indexes the ledger and serves off-chain social data to clients.

## High-Level Overview

```
                     ┌────────────────────────────┐
                     │        Soroban RPC         │
                     │   (Stellar network layer)  │
                     └────────────┬───────────────┘
                                  │
        ┌─────────────────────────┼──────────────────────────┐
        │                         │                          │
┌───────▼────────┐      ┌─────────▼────────┐      ┌──────────▼─────────┐
│   contracts/   │      │     backend/     │      │     backend/       │
│  smart contracts│     │   event indexer  │      │  REST + WebSocket  │
│ (payment, graph)│      │  + off-chain DB  │      │   (Axum server)    │
└───────┬────────┘      └─────────┬────────┘      └──────────┬─────────┘
        │                        │                           │
        └────────────────────────┼───────────────────────────┘
                                 │  HTTPS / SEP-24 / SEP-38
                    ┌────────────▼────────────┐
                    │        Clients          │
                    │  mobileapp · dashboard  │
                    │       marketing         │
                    └─────────────────────────┘
```

## Layers

### Smart Contracts (`contracts/`)

A Cargo workspace of Soroban contracts:

- **`social_payment`** — the core payment contract enforcing amount, fee, and
  metadata.
- **`user_registry`** — maps usernames/addresses to XoXoPay identities.
- **`social_graph`** — friendship and follow relationships with mutual-accept
  flows.
- **`naira_token`** — a fiat-backed token flavour for Naira-flavoured flows.
- **`yield_vault`** — time-locked savings vaults with projected APY.
- **`allbridge_receiver`** — accepts cross-chain bridge messages from
  Allbridge Core.

Contracts are compiled to `wasm32-unknown-unknown` and deployed to Stellar
networks via the Soroban CLI.

### Backend (`backend/`)

An Axum (Tokio) Rust server that:

- **Indexes** the Stellar ledger, parsing contract events into a Postgres
  model (`backend/src/indexer/`).
- **Serves** REST endpoints for feeds, auth, users, yields, and admin
  (`backend/src/api/`).
- **Persists** social state (likes, comments, friends) in Postgres via
  `sqlx`.
- **Caches** hot paths with Redis (`backend/src/services/redis_cache*.rs`).
- **Runs workers** for disbursements, sweeps, and yield accrual
  (`backend/src/services/*_worker.rs`).
- **Enforces** auth, rate limiting, and geo-restriction middleware.

### Mobile App (`mobileapp/`)

React Native (Expo) app featuring social payments, username registration,
offline transaction queueing, NFC tap-to-pay, mnemonic backup/verification,
biometric unlock, and SDP deep links (`xoxopay://`).

### Dashboard (`dashboard/`)

Next.js operator dashboard for monitoring social statistics, Naira
transaction volume, and bridging queues, with role-based access guards.

### Marketing (`marketing/`)

Next.js site hosting public pages (privacy policy, terms of service).

## Data Flow

1. A user sends a payment. The app constructs a Soroban call (or a
   `xoxopay://` deep link) and submits it to the network.
2. The `indexer` observes the transaction, stores canonical fields, and emits
   social events for the feed.
3. Clients poll or subscribe to the backend to see comments, likes, and
   balances in real time.
4. Offline or slow connections are handled by the mobile offline queue, which
   replays queued requests on reconnect.

See [contracts.md](contracts.md), [api.md](api.md), and
[deployment.md](deployment.md) for details.