# XoXoPay

**Social payments on the Stellar network.**

XoXoPay is a high-speed, interactive social payments platform built on the
Stellar blockchain with Soroban smart contracts. It turns standard financial
transactions into peer-to-peer social interactions — allowing users to pay
friends, add comments, toggle likes, and share payments publicly or privately,
in the same spirit as Venmo and Cash App, while staying self-custodial and
on-chain.

---

## Key Features

1. **Social Payments Feed** — Share peer-to-peer payments (e.g. *"John paid
   ₦5,000 to Doe for Lunch"*) with interactive liking and commenting.
2. **Fiat Settlement via Stellar Anchors** — Seamlessly deposit and withdraw
   fiat currencies (including Naira ₦) with automated conversion and
   settlement handled through regulated Stellar Anchors (SEP-24 / SEP-38).
3. **Cross-Chain Bridge Funding** — Fund your Stellar wallet from other major
   blockchains (Ethereum, Solana, BNB Chain, Polygon) via the Allbridge Core
   integration.
4. **Yield Vaults** — Time-locked savings vaults with projected APY, built on
   Soroban.
5. **Soroban Smart Contracts** — High-speed, secure, and gas-efficient
   execution of payments and social graphs on-chain.

---

## Repository Architecture

| Directory      | Purpose                                                                 |
| -------------- | ----------------------------------------------------------------------- |
| `mobileapp/`   | React Native (Expo) app for social payments, profile management, cross-chain funding, NFC tap-to-pay, and offline queueing. |
| `backend/`     | Axum Rust server. Manages off-chain social logs (likes, comments, friends) and indexes Stellar ledger events. |
| `contracts/`   | Soroban smart contract workspace: user registry, social payments, social graph, Naira token, yield vault, Allbridge receiver. |
| `dashboard/`   | Next.js web application for monitoring social statistics, Naira transaction volume, and bridging queues. |
| `marketing/`   | Marketing site (Next.js) hosting public pages such as privacy policy and terms of service. |
| `scripts/`     | Tooling and automation scripts.                                          |
| `k8s/`         | Kubernetes deployment manifests.                                         |

See [docs/architecture.md](docs/architecture.md) for a deeper walkthrough.

---

## Getting Started

### Mobile App (Expo)

```bash
cd mobileapp
npm install
npm start
```

### Backend API (Rust)

```bash
cd backend
cargo run
```

### Smart Contracts (Soroban)

```bash
cd contracts
cargo build --target wasm32-unknown-unknown --release
cargo test
```

### Full stack with Docker

```bash
docker-compose up -d
```

---

## Documentation

| Topic          | Link                                        |
| -------------- | ------------------------------------------- |
| Architecture   | [docs/architecture.md](docs/architecture.md) |
| Smart Contracts| [docs/contracts.md](docs/contracts.md)       |
| API            | [docs/api.md](docs/api.md)                   |
| Testing        | [docs/testing.md](docs/testing.md)           |
| Development    | [docs/development.md](docs/development.md)   |
| Deployment     | [docs/deployment.md](docs/deployment.md)     |
| Security       | [docs/security.md](docs/security.md)         |
| FAQ            | [docs/faq.md](docs/faq.md)                   |

For security concerns, please review [SECURITY.md](SECURITY.md) and report
issues privately via the disclosure policy.

---

## Contributing

Contributions are welcome. Please read
[CONTRIBUTING.md](CONTRIBUTING.md) and
[CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) before opening your first pull
request. Every commit and PR is expected to pass the repository's automated
CI checks.

---

## License

Released under the MIT License. See [LICENSE](LICENSE) for details.