# Smart Contracts

The `contracts/` directory is a Cargo workspace of Soroban smart contracts
that orchestrate payments and social relationships on the Stellar network.

## Workspace Layout

```
contracts/
├── contracts/
│   ├── social_payment/     # Core payment contract
│   ├── user_registry/      # Username → address registry
│   ├── social_graph/       # Friendship / follow graph
│   ├── naira_token/        # Fiat (Naira) token flavour
│   ├── yield_vault/        # Timed savings vaults with APY
│   └── allbridge_receiver/ # Allbridge cross-chain receiver
└── README.md
```

## Building

Compile all contracts to Soroban WASM:

```bash
cd contracts
cargo build --target wasm32-unknown-unknown --release
```

## Testing

```bash
cargo test
```

Contract tests exercise on-chain logic, including snapshot-based tests for
social graph flows (e.g. mutual friendship acceptance) and payment
validation rules.

## Contracts Overview

### Social Payment

The core contract. Enforces that payments carry valid amounts, fees, and
metadata, and emits the events the backend indexer parses. Validation rules
are documented per-issue in `issues/smart-contracts/`.

### User Registry

Binds a human-readable username to a Stellar address. Enforces uniqueness and
username format rules (see `backend/src/api/user.rs` for the server-side
validation that mirrors registry rules).

### Social Graph

Maintains one-way follow and two-way friendship relationships with a
mutual-accept (request → accept) flow.

### Yield Vault

Locks funds for a configured duration. Deposits are confirmed via draw-based
UI in the app (with projected APY shown). Accrual and claim sweep logic runs
both on-chain (contract) and off-chain (backend `yield_service.rs`).

### Allbridge Receiver

Accepts cross-chain transfer messages from Allbridge Core and mints the
corresponding token flavour on Stellar, enabling funding from Ethereum,
Solana, BNB Chain, and Polygon.

## Deployment

Contracts are deployed with the Soroban CLI against a Stellar network. See
[deployment.md](deployment.md) and `k8s/` for production topology.