# syntax=docker/dockerfile:1

# ---- Build stage -----------------------------------------------------------
FROM rust:1.91 AS builder
WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake ninja-build clang \
    && rm -rf /var/lib/apt/lists/*

COPY Cargo.toml Cargo.lock ./
COPY .cargo ./.cargo
COPY migrations ./migrations
COPY src ./src

RUN cargo build --release --bin xoxopay-backend

# ---- Runtime stage ---------------------------------------------------------
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates tzdata \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=builder /app/target/release/xoxopay-backend /app/xoxopay-backend

ENV RUST_LOG=xoxopay-backend=info,tower_http=info
EXPOSE 8080

ENTRYPOINT ["/app/xoxopay-backend"]