# Contributing to XoXoPay

Thank you for your interest in contributing to XoXoPay! This document outlines
the process for reporting issues, submitting changes, and keeping the project
healthy.

## Code of Conduct

This project adheres to the [Code of Conduct](CODE_OF_CONDUCT.md). By
participating, you agree to uphold its standards. Please report unacceptable
behavior to the maintainers.

## Getting Started

1. Fork the repository and clone your fork.
2. Install the required toolchains:
   - **Mobile app**: Node.js 18+ (see `.nvmrc`) with npm.
   - **Backend**: Rust stable (see `backend/rust-toolchain.toml`).
   - **Contracts**: Rust stable with the `wasm32-unknown-unknown` target.
3. Create a feature branch: `git checkout -b feat/my-change`.
4. Make your changes and commit them with a clear, conventional message.
5. Push your branch and open a pull request.

## Project Layout

- `mobileapp/` — React Native (Expo) mobile application.
- `backend/` — Rust (Axum) API server.
- `contracts/` — Soroban smart contracts workspace.
- `dashboard/` — Next.js operator dashboard.
- `marketing/` — Marketing site (Next.js).

See [docs/architecture.md](docs/architecture.md) for details.

## Development Workflow

- Keep changes focused on a single concern.
- Follow existing code style. Rust code is formatted with `cargo fmt`; web and
  mobile code with Prettier (see `.prettierrc.json`).
- Add or update tests for any changed behaviour.
- Verify locally before opening a PR:
  - Backend: `cargo test`
  - Mobile app: `npm test`
  - Contracts: `cargo test`
- Ensure your changes pass CI (formatting, linting, tests).

## Conventional Commits

We use [Conventional Commits](https://www.conventionalcommits.org/) to keep the
history readable:

- `feat: <summary>` — a new feature.
- `fix: <summary>` — a bug fix.
- `docs: <summary>` — documentation changes.
- `refactor: <summary>` — a change that does not alter behaviour.
- `chore: <summary>` — tooling, build, or dependency changes.

## Pull Request Checklist

- [ ] Description explains the motivation and the change.
- [ ] Tests pass locally and in CI.
- [ ] No unrelated changes included.
- [ ] Commit messages follow Conventional Commits.

## Reporting Issues

- **Security vulnerabilities**: do **not** open a public issue. Follow the
  disclosure policy in [SECURITY.md](SECURITY.md).
- **Bugs**: use the bug report template.
- **Feature ideas**: use the feature request template.

## License

By contributing, you agree that your contributions are licensed under the
[MIT License](LICENSE).