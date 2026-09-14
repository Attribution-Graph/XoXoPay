# Deployment

XoXoPay ships as a set of containers deployed to Kubernetes, with build and
deploy automation on GitHub Actions.

## Components

- **Backend** — Rust/Axum API + indexer + workers, containerised and pushed
  to GHCR.
- **Contracts** — Soroban WASM artifacts, deployed to the Stellar network via
  the Soroban CLI during release.
- **Mobile app** — Expo build; over-the-air updates and store publishing.
- **Dashboard / Marketing** — Next.js builds (staging + production).

## Environments

| Environment | Branch    | Workflow                  |
| ----------- | --------- | ------------------------- |
| Staging     | feature   | `deploy-staging.yml`      |
| Production  | master    | `deploy-production.yml`   |
| Rollback    | (manual)  | `rollback.yml`            |

## Images

The backend image is published to GHCR as
`ghcr.io/<repo>/xoxopay-backend` (see `.github/workflows/ci.yml`). Image tags
follow Git refs; `deploy-production.yml` tracks the previously deployed image
for rollbacks.

## Kubernetes

`k8s/deployment.yaml` defines the production deployment: backend replicas,
Postgres, Redis, and Soroban RPC wiring, plus ingress and secrets.

## Infrastructure

- `docker-compose.yml` — local full-stack bring-up (Postgres, Redis, Soroban
  Quickstart).
- `k8s/` — production manifests.
- `backend/Dockerfile`-equivalent build steps defined in the CI workflows.

## Release Checklist

1. Merge to `master`; CI runs `ci.yml` on push.
2. Verify staging deploy in `deploy-staging.yml`.
3. Trigger `deploy-production.yml` from a tag/release.
4. If a production issue appears, use `rollback.yml` to redeploy the previous
   image.

## Environments & Secrets

Secrets are stored as GitHub Actions secrets and referenced by the deploy
workflows. Never commit secrets (see `SECURITY.md`).