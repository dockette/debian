# AGENTS.md

## Project

Base Debian Docker images for Dockette. Images provide a `dfx` user with UID `1000`, `USER_*` environment constants, `/bin/bash` as the default command, and cleanup for smaller layers.

## Images

- Docker image: `dockette/debian`.
- Default Makefile build: `bookworm` from `bookworm/Dockerfile` with tag `bookworm`.
- Supported directories include `sid`, `bookworm`, `bullseye`, `buster`, `stretch`, `jessie`, and `wheezy`.
- Standard variants use `Dockerfile`; slim variants use `Dockerfile.slim` and tags like `bookworm-slim`.
- GitHub Actions tests and publishes selected tags, including `latest`, `bookworm`, `bookworm-slim`, `bullseye`, `bullseye-slim`, `buster`, `buster-slim`, `stretch`, and `stretch-slim`.

## Commands

- `make build` builds `dockette/debian:${DOCKER_TAG}` from `${DOCKER_VERSION}/Dockerfile`.
- `make build-bookworm-slim` builds a slim variant by overriding `DOCKER_FILE`.
- `make test` verifies the `dfx` user, `USER_NAME`, and `/etc/debian_version` inside the image.
- `make run` opens `/bin/bash` in the selected image.
- Override `DOCKER_VERSION`, `DOCKER_TAG`, and `DOCKER_FILE` when working on a specific variant.

## Testing

- Use `make -n build test run` to dry-run the default commands before changing build logic.
- Run the matching `make test-*` target after building any variant that has a test target.
- Keep Makefile targets and workflow matrix entries aligned when adding, removing, or retagging variants.

## Guidelines

- Keep Dockerfiles, `Makefile`, README usage examples, and `.github/workflows/docker.yml` tag matrices aligned.
- Prefer `DOCKER_*` names for Docker-related Makefile variables.
- Place `.PHONY: <target>` directly above each Makefile target.
- Preserve the `dfx` user contract and cleanup pattern unless intentionally changing all variants.
- Do not introduce unrelated formatting or structural changes.
