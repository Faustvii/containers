FROM ghcr.io/home-operations/actions-runner:2.338.2@sha256:2dd7caa094a425c041539447cb0e6ae63cda10b5242773764683b695b8fa5613

USER root

# CGO needs both a C compiler and libc headers. The upstream image only
# installs gcc on amd64; build-essential supplies the full toolchain on both
# amd64 and arm64, including libc6-dev and make for Go build/test workflows.
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && rm -rf /var/lib/apt/lists/*

# Workflows install their Go version with Mise or actions/setup-go.
USER runner
