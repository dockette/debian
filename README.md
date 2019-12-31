# Debian

Base docker image based on Debian. Special variants for Sid / Jessie / Wheezy.

------

[![Docker Stars](https://img.shields.io/docker/stars/dockette/debian.svg?style=flat)](https://hub.docker.com/r/dockette/debian/)
[![Docker Pulls](https://img.shields.io/docker/pulls/dockette/debian.svg?style=flat)](https://hub.docker.com/r/dockette/debian/)

## Discussion / Help

[![Join the chat](https://img.shields.io/gitter/room/dockette/dockette.svg?style=flat-square)](https://gitter.im/dockette/dockette?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

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
