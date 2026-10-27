FROM ghcr.io/home-operations/actions-runner:2.338.1@sha256:9011bec82009308072bb8677229181791f96bada721df8a91108290ad4a3fdc5

USER root

# CGO needs both a C compiler and libc headers. The upstream image only
# installs gcc on amd64; build-essential supplies the full toolchain on both
# amd64 and arm64, including libc6-dev and make for Go build/test workflows.
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && rm -rf /var/lib/apt/lists/*

# Workflows install their Go version with Mise or actions/setup-go.
USER runner
