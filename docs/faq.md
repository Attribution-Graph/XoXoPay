# FAQ

## What is XoXoPay?

XoXoPay is a social payments platform built on the Stellar network with
Soroban smart contracts. Users can pay friends, comment, like, and share
payments publicly or privately — similar to Venmo or Cash App, but
self-custodial and on-chain.

## Which blockchains does it support?

Payments and balances live on **Stellar**. Wallets can be funded from
**Ethereum, Solana, BNB Chain, and Polygon** through the Allbridge Core
integration.

## How do I deposit or withdraw fiat?

Through **Stellar Anchors** using SEP-24 / SEP-38 flows. The platform supports
fiat-flavoured tokens including Naira (₦).

## Where do the smart contracts run?

On Stellar via **Soroban** (WASM). The workspace lives in `contracts/` and
includes payment, registry, graph, token, vault, and bridge contracts.

## Is there a mobile app?

Yes — a React Native (Expo) app in `mobileapp/` with offline queueing, NFC
tap-to-pay, mnemonic backup/verification, biometric unlock, and
`xoxopay://` deep links.

## How does the offline queue work?

When the device loses connectivity, outgoing requests are queued locally and
replayed on reconnect (`mobileapp/src/services/offlineQueue.ts`). Requests
are signed so replay is safe.

## What is the operator dashboard for?

`dashboard/` is a Next.js app for monitoring social statistics, Naira
transaction volume, and bridging queues. Access is role-restricted.

## How is security handled?

See `SECURITY.md` and `docs/security.md`. Key controls: Privy auth, rate
limiting, geo guards, on-chain invariants, vault lock rules, mnemonic
recovery, and nonce-based anti-replay.

## How do I run the whole stack locally?

```bash
docker-compose up -d
```

Then run each layer as described in `docs/development.md`.

## How do I contribute?

Read `CONTRIBUTING.md` and `CODE_OF_CONDUCT.md`, then open a pull request.
Ensure CI passes for your change.

## Where can I report a security issue?

Privately, per `SECURITY.md` — do not open a public issue.