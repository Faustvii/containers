FROM alpine:3.24@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf

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

