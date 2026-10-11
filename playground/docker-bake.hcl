// Build definition for playground. CI builds the `image-all` target through
// .github/workflows/image-builder.yaml, with docker/metadata-action filling in
// `docker-metadata-action` (tags and labels). `docker buildx bake` in this
// directory builds `image-local` into the local Docker image store.
target "docker-metadata-action" {}

group "default" {
  targets = ["image-local"]
}

target "image" {
  inherits = ["docker-metadata-action"]
}

target "image-local" {
  inherits = ["image"]
  output   = ["type=docker"]
  tags     = ["playground:local"]
}

target "image-all" {
  inherits  = ["image"]
  platforms = ["linux/amd64", "linux/arm64"]
}
