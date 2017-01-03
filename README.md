# Debian

Base docker image based on Debian / Jessie (8).

------

[![Docker Stars](https://img.shields.io/docker/stars/dockette/debian.svg?style=flat)](https://hub.docker.com/r/dockette/debian/)
[![Docker Pulls](https://img.shields.io/docker/pulls/dockette/debian.svg?style=flat)](https://hub.docker.com/r/dockette/debian/)

## Discussion / Help

[![Join the chat](https://img.shields.io/gitter/room/dockette/dockette.svg?style=flat-square)](https://gitter.im/contributte/contributte?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Image

- predefined user `dfx` with UID `1000`
- predefined constants:
    - USER_UID: 1000
    - USER_NAME: dfx
    - USER_HOME: /home/dfx
- some optimalization for smaller image 

## Jessie

[![Docker Stars](https://img.shields.io/docker/stars/dockette/jessie.svg?style=flat)](https://hub.docker.com/r/dockette/jessie/)
[![Docker Pulls](https://img.shields.io/docker/pulls/dockette/jessie.svg?style=flat)](https://hub.docker.com/r/dockette/jessie/)

```
docker run dockette/debian:jessie /bin/bash
```

```
docker run dockette/jessie /bin/bash
```

## Sid

[![Docker Stars](https://img.shields.io/docker/stars/dockette/sid.svg?style=flat)](https://hub.docker.com/r/dockette/sid/)
[![Docker Pulls](https://img.shields.io/docker/pulls/dockette/sid.svg?style=flat)](https://hub.docker.com/r/dockette/sid/)

```
docker run dockette/debian:sid /bin/bash
```

```
docker run dockette/sid /bin/bash
```
