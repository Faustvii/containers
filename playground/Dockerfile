FROM alpine:3.24@sha256:ce9e1e6d23f04a0b7593445a062a9fc73ed52f8260b9396f77a958295ad18ee7

ARG TARGETARCH

# renovate: datasource=github-releases depName=kubernetes/kubernetes
ENV KUBECTL_VERSION=v1.37.2

# Install required tools
RUN apk add --no-cache \
      bash \
      curl \
      grep \
      sed \
      coreutils \
      ca-certificates \
    && curl -sSL -o /usr/local/bin/kubectl \
         https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${TARGETARCH}/kubectl \
    && chmod +x /usr/local/bin/kubectl

WORKDIR /app

ENTRYPOINT ["/bin/bash", "-c"]

