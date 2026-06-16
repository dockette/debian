DOCKER_IMAGE ?= dockette/debian
DOCKER_VERSION?=bookworm
DOCKER_TAG?=${DOCKER_VERSION}
DOCKER_FILE?=${DOCKER_VERSION}/Dockerfile

.PHONY: build
build:
	docker buildx build --pull -t ${DOCKER_IMAGE}:${DOCKER_TAG} -f ${DOCKER_FILE} ./${DOCKER_VERSION}

.PHONY: test
test:
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} sh -lc 'test "$$(id -u dfx)" = "1000" && test "$${USER_NAME}" = "dfx" && test -f /etc/debian_version'

.PHONY: run
run:
	docker run --rm -it ${DOCKER_IMAGE}:${DOCKER_TAG} /bin/bash

build-sid: DOCKER_VERSION=sid
build-sid: DOCKER_TAG=sid
.PHONY: build-sid
build-sid: build # dev

build-bookworm: DOCKER_VERSION=bookworm
build-bookworm: DOCKER_TAG=bookworm
.PHONY: build-bookworm
build-bookworm: build # 12

build-bookworm-slim: DOCKER_VERSION=bookworm
build-bookworm-slim: DOCKER_TAG=bookworm-slim
build-bookworm-slim: DOCKER_FILE=bookworm/Dockerfile.slim
.PHONY: build-bookworm-slim
build-bookworm-slim: build # 12

test-bookworm: DOCKER_TAG=bookworm
.PHONY: test-bookworm
test-bookworm: test # 12

test-bookworm-slim: DOCKER_TAG=bookworm-slim
.PHONY: test-bookworm-slim
test-bookworm-slim: test # 12

run-bookworm: DOCKER_TAG=bookworm
.PHONY: run-bookworm
run-bookworm: run # 12

run-bookworm-slim: DOCKER_TAG=bookworm-slim
.PHONY: run-bookworm-slim
run-bookworm-slim: run # 12

build-bullseye: DOCKER_VERSION=bullseye
build-bullseye: DOCKER_TAG=bullseye
.PHONY: build-bullseye
build-bullseye: build # 11

build-bullseye-slim: DOCKER_VERSION=bullseye
build-bullseye-slim: DOCKER_TAG=bullseye-slim
build-bullseye-slim: DOCKER_FILE=bullseye/Dockerfile.slim
.PHONY: build-bullseye-slim
build-bullseye-slim: build # 11

test-bullseye: DOCKER_TAG=bullseye
.PHONY: test-bullseye
test-bullseye: test # 11

test-bullseye-slim: DOCKER_TAG=bullseye-slim
.PHONY: test-bullseye-slim
test-bullseye-slim: test # 11

run-bullseye: DOCKER_TAG=bullseye
.PHONY: run-bullseye
run-bullseye: run # 11

run-bullseye-slim: DOCKER_TAG=bullseye-slim
.PHONY: run-bullseye-slim
run-bullseye-slim: run # 11

build-buster: DOCKER_VERSION=buster
build-buster: DOCKER_TAG=buster
.PHONY: build-buster
build-buster: build # 10

build-stretch: DOCKER_VERSION=stretch
build-stretch: DOCKER_TAG=stretch
.PHONY: build-stretch
build-stretch: build # 9

build-jessie: DOCKER_VERSION=jessie
build-jessie: DOCKER_TAG=jessie
.PHONY: build-jessie
build-jessie: build # 8

build-wheezy: DOCKER_VERSION=wheezy
build-wheezy: DOCKER_TAG=wheezy
.PHONY: build-wheezy
build-wheezy: build # 7

.PHONY: docker-build-sid
docker-build-sid: build-sid
.PHONY: docker-build-bookworm
docker-build-bookworm: build-bookworm
.PHONY: docker-build-bullseye
docker-build-bullseye: build-bullseye
.PHONY: docker-build-buster
docker-build-buster: build-buster
.PHONY: docker-build-stretch
docker-build-stretch: build-stretch
.PHONY: docker-build-jessie
docker-build-jessie: build-jessie
.PHONY: docker-build-wheezy
docker-build-wheezy: build-wheezy
