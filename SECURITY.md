# Security Policy

XoXoPay handles money. Security is a top priority, and we take responsible
disclosure seriously.

## Reporting a Vulnerability

**Do not open a public GitHub issue for security vulnerabilities.**

Instead, report suspected vulnerabilities privately to the maintainers at
`merlik787@gmail.com`. Include:

- A clear description of the vulnerability.
- The affected component (`mobileapp/`, `backend/`, `contracts/`,
  `dashboard/`, deployments, etc.).
- Reproducer steps, if available.
- Whether any funds or credentials may have been exposed.

## What Happens Next

- Reports are acknowledged within **72 hours**.
- The maintainers investigate and determine severity and impact.
- Fixes are prioritized based on severity (e.g. funds-at-risk issues first).
- Once a fix is released, the vulnerability is disclosed responsibly.

## Security Considerations

- The backend combines off-chain social data with on-chain payment state;
  see [docs/security.md](docs/security.md) for the threat model and controls.
- Smart contracts are the highest-risk surface; treat the
  `contracts/contracts/*/src/lib.rs` modules as security-critical.
- Never commit secrets, admin credentials, or private keys. Gitleaks runs in
  CI to help enforce this.

## Supported Areas

| Area            | Security relevance                              |
| --------------- | ----------------------------------------------- |
| `contracts/`    | Consensus-critical Soroban smart contracts.     |
| `backend/`      | Mint/burn orchestration, auth, rate limiting.   |
| `mobileapp/`    | Wallet recovery, key storage, NFC tap-to-pay.   |
| `dashboard/`    | Operator-only UI and administrative controls.   |