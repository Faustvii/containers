# Actions runner

Extends the home-operations Actions runner with `build-essential` on amd64 and
arm64, providing GCC, libc development headers, and Make for Go workflows using
CGO and the race detector. It retains the upstream runner user and configuration.
Install the Go version required by each project with Mise or `actions/setup-go`.

The Warden [Go Lint job](https://github.com/Faustvii/warden/actions/runs/40562760143/job/122395911237?pr=68)
installed Go successfully, then failed while Mise compiled `govulncheck` because
`runtime/cgo` could not find headers including `stdlib.h`, `stdint.h`, and
`pthread.h`. Installing GCC alone does not supply these headers; `build-essential`
includes `libc6-dev` as well as the compiler.

Build locally from this directory:

```sh
docker buildx bake
```

The existing PR workflow discovers this image through `docker-bake.hcl` and
builds both platforms. Release Please manages its releases; the release workflow
publishes `ghcr.io/faustvii/containers/actions-runner:<version>`.
After the first release, replace the runner container's `image` with the published
tag and digest from that release's build summary. For example, if the first
release is `1.0.0`:

```yaml
image: ghcr.io/faustvii/containers/actions-runner:1.0.0
```

Keep the existing Mise setup in Warden to install Go and its project tools.
