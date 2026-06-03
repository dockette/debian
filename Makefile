DOCKER_IMAGE ?= dockette/debian
DOCKER_VERSION?=bookworm
DOCKER_TAG?=${DOCKER_VERSION}
DOCKER_FILE?=${DOCKER_VERSION}/Dockerfile

build:
	docker buildx build --pull -t ${DOCKER_IMAGE}:${DOCKER_TAG} -f ${DOCKER_FILE} ./${DOCKER_VERSION}

test:
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} sh -lc 'test "$$(id -u dfx)" = "1000" && test "$${USER_NAME}" = "dfx" && test -f /etc/debian_version'

run:
	docker run --rm -it ${DOCKER_IMAGE}:${DOCKER_TAG} /bin/bash

build-sid: DOCKER_VERSION=sid
build-sid: DOCKER_TAG=sid
build-sid: build # dev

build-bookworm: DOCKER_VERSION=bookworm
build-bookworm: DOCKER_TAG=bookworm
build-bookworm: build # 12

build-bookworm-slim: DOCKER_VERSION=bookworm
build-bookworm-slim: DOCKER_TAG=bookworm-slim
build-bookworm-slim: DOCKER_FILE=bookworm/Dockerfile.slim
build-bookworm-slim: build # 12

test-bookworm: DOCKER_TAG=bookworm
test-bookworm: test # 12

test-bookworm-slim: DOCKER_TAG=bookworm-slim
test-bookworm-slim: test # 12

run-bookworm: DOCKER_TAG=bookworm
run-bookworm: run # 12

run-bookworm-slim: DOCKER_TAG=bookworm-slim
run-bookworm-slim: run # 12

build-bullseye: DOCKER_VERSION=bullseye
build-bullseye: DOCKER_TAG=bullseye
build-bullseye: build # 11

build-bullseye-slim: DOCKER_VERSION=bullseye
build-bullseye-slim: DOCKER_TAG=bullseye-slim
build-bullseye-slim: DOCKER_FILE=bullseye/Dockerfile.slim
build-bullseye-slim: build # 11

test-bullseye: DOCKER_TAG=bullseye
test-bullseye: test # 11

test-bullseye-slim: DOCKER_TAG=bullseye-slim
test-bullseye-slim: test # 11

run-bullseye: DOCKER_TAG=bullseye
run-bullseye: run # 11

run-bullseye-slim: DOCKER_TAG=bullseye-slim
run-bullseye-slim: run # 11

build-buster: DOCKER_VERSION=buster
build-buster: DOCKER_TAG=buster
build-buster: build # 10

build-stretch: DOCKER_VERSION=stretch
build-stretch: DOCKER_TAG=stretch
build-stretch: build # 9

build-jessie: DOCKER_VERSION=jessie
build-jessie: DOCKER_TAG=jessie
build-jessie: build # 8

build-wheezy: DOCKER_VERSION=wheezy
build-wheezy: DOCKER_TAG=wheezy
build-wheezy: build # 7

docker-build-sid: build-sid
docker-build-bookworm: build-bookworm
docker-build-bullseye: build-bullseye
docker-build-buster: build-buster
docker-build-stretch: build-stretch
docker-build-jessie: build-jessie
docker-build-wheezy: build-wheezy
