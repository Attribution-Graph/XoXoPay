# Changelog

All notable changes to XoXoPay are documented in this file.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added

- Professional repository documentation: architecture, contracts, API,
  testing, development, deployment, security, and FAQ guides.
- Contribution guidelines (`CONTRIBUTING.md`) and a code of conduct
  (`CODE_OF_CONDUCT.md`).
- Security disclosure policy (`SECURITY.md`) and MIT license (`LICENSE`).
- Repository tooling: `Makefile`, `.editorconfig`, `.nvmrc`,
  `.gitattributes`, `.dockerignore`, Prettier configuration, and
  dependency-bot automation.
- Issue templates and a pull request template.
- Layer-specific READMEs for the mobile app and dashboard.

### Changed

- Renamed the project and rebranded the repository to XoXoPay.
- Replaced the top-level `Readme.md` with a professional `README.md`.

## [0.1.0] - 2025

### Added

- Stellar-based social payments feed with likes and comments.
- Fiat settlement through Stellar Anchors (SEP-24 / SEP-38) including Naira.
- Cross-chain wallet funding via Allbridge Core.
- Soroban smart contracts: user registry, social payments, social graph,
  Naira token, yield vault, and Allbridge receiver.
- Rust backend (Axum) with off-chain social logs and Stellar event indexing.
- React Native (Expo) mobile app with offline queue and NFC tap-to-pay.
- Next.js dashboard for monitoring social statistics and bridging queues.

_This changelog was recreated as part of the repository rebrand; earlier
history is preserved in the git log._