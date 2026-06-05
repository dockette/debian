# Debian

<p align=center>
   <a href="https://github.com/dockette/debian/actions"><img src="https://github.com/dockette/debian/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/debian"><img src="https://img.shields.io/docker/pulls/dockette/debian.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

Base Docker image based on Debian.

------

## Image

- predefined user `dfx` with UID `1000`
- predefined constants:
    - `USER_UID`: `1000`
    - `USER_NAME`: `dfx`
    - `USER_HOME`: `/home/dfx`
- cleanup and optimization for smaller images

## Tags

The default local build uses `bookworm` from `bookworm/Dockerfile`.

The Makefile provides named standard build targets for directory variants and named slim/test/run targets for `bookworm` and `bullseye`; use `DOCKER_VERSION`, `DOCKER_TAG`, and `DOCKER_FILE` overrides for other slim or manual builds.

CI tests these tags:

- `bookworm`, `bookworm-slim`
- `bullseye`, `bullseye-slim`
- `latest` (built from `bullseye/Dockerfile`)

CI also publishes legacy compatibility tags `buster`, `buster-slim`, `stretch`, and `stretch-slim`. These Debian releases are EOL; prefer current tags for new images.

Additional directories exist for `sid`, `jessie`, and `wheezy`, but they are not in the workflow matrix. `jessie` and `wheezy` are EOL and should only be built manually when compatibility requires them.

## CLI

```sh
docker run -it --rm dockette/debian:bookworm /bin/bash
docker run -it --rm dockette/debian:bookworm-slim /bin/bash

docker run -it --rm dockette/debian:bullseye /bin/bash
docker run -it --rm dockette/debian:bullseye-slim /bin/bash
```

## Base

```Dockerfile
FROM dockette/debian:bookworm

RUN apt update && apt install -y curl
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
