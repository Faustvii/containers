FROM alpine:3.22@sha256:5291449c3df73caf6ed85e649dec1b9e818b39a5d8c871e97afc13e9cd5e8fa8

# renovate: datasource=github-releases depName=kubernetes/kubernetes
ENV KUBECTL_VERSION=v1.37.1

# Install required tools
RUN apk add --no-cache \
      bash \
      curl \
      grep \
      sed \
      coreutils \
      ca-certificates \
    && curl -sSL -o /usr/local/bin/kubectl \
         https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x /usr/local/bin/kubectl

WORKDIR /app

ENTRYPOINT ["/bin/bash", "-c"]

