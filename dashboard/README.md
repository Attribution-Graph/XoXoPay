# XoXoPay Dashboard

Next.js operator dashboard for XoXoPay.

## Contents

- Social statistics monitoring.
- Naira transaction volume tracking.
- Cross-chain bridging queue visibility.
- CSV-based disbursements.
- Mobile navigation experience for operators on the go.

## Getting Started

```bash
npm install
npm run dev
```

## Tests

Playwright E2E specs live in `e2e/`:

```bash
npx playwright test
```

Covers auth guards (role-based route protection), CSV disbursement, and
mobile nav.