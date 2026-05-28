# Debian

<p align=center>
   <a href="https://github.com/dockette/debian/actions"><img src="https://github.com/dockette/debian/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/debian"><img src="https://img.shields.io/docker/pulls/dockette/debian.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

Base docker image based on Debian. Special variants for Sid / Jessie / Wheezy.

------

## Image

- predefined user `dfx` with UID `1000`
- predefined constants:
    - `USER_UID`: `1000`
    - `USER_NAME`: `dfx`
    - `USER_HOME`: `/home/dfx`
- some optimalization for smaller image 

## CLI

```
docker run -it --rm dockette/debian:sid /bin/bash
docker run -it --rm dockette/debian:sid-slim /bin/bash

docker run -it --rm dockette/debian:bookworm /bin/bash
docker run -it --rm dockette/debian:bookworm-slim /bin/bash

docker run -it --rm dockette/debian:bullseye /bin/bash
docker run -it --rm dockette/debian:bullseye-slim /bin/bash

docker run -it --rm dockette/debian:buster /bin/bash
docker run -it --rm dockette/debian:buster-slim /bin/bash

docker run -it --rm dockette/debian:stretch /bin/bash
docker run -it --rm dockette/debian:stretch-slim /bin/bash

docker run -it --rm dockette/debian:jessie /bin/bash
docker run -it --rm dockette/debian:jessie-slim /bin/bash

docker run -it --rm dockette/debian:wheezy /bin/bash
docker run -it --rm dockette/debian:wheezy-slim /bin/bash
```

## Base

```
FROM dockette/debian:buster-slim

RUN apt update && apt install -y curl
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
