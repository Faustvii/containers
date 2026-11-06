FROM alpine:3.24@sha256:3f4d6b32e26703c6082839234f43769d5046b3ac7c910033911d1e71d8cd630a

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

