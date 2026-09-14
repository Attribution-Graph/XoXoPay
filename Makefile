.PHONY: help install backend test contracts mobile dashboard format lint

help: ## Show available targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

install: ## Install root-level dependencies
	npm install

backend: ## Run the backend
	cd backend && cargo run

test: ## Run backend and contract tests
	cd backend && cargo test --all-features
	cd contracts && cargo test

contracts: ## Build contracts for Soroban (WASM)
	cd contracts && cargo build --target wasm32-unknown-unknown --release

mobile: ## Run the mobile app
	cd mobileapp && npm start

mobile-test: ## Run mobile tests
	cd mobileapp && npm test

dashboard: ## Run the dashboard
	cd dashboard && npm run dev

format: ## Format Rust and JS/TS code
	cd backend && cargo fmt
	npx prettier --write .

lint: ## Lint backend and mobile code
	cd backend && cargo clippy --all-targets --all-features -- -D warnings
	cd mobileapp && npm run lint