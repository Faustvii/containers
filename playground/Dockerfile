FROM alpine:3.24@sha256:71e9b7bae160ba167fa17414401b94cbcdaf3c32feeab9298bd794a2a0614c35

ARG TARGETARCH

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
         https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${TARGETARCH}/kubectl \
    && chmod +x /usr/local/bin/kubectl

WORKDIR /app

ENTRYPOINT ["/bin/bash", "-c"]

