DOCKER_IMAGE ?= dockette/debian
VERSION ?= bookworm
TAG ?= $(VERSION)
DOCKERFILE ?= $(VERSION)/Dockerfile

build:
	docker buildx build --pull -t $(DOCKER_IMAGE):$(TAG) -f $(DOCKERFILE) ./$(VERSION)

test:
	docker run --rm $(DOCKER_IMAGE):$(TAG) sh -lc 'test "$$(id -u dfx)" = "1000" && test "$${USER_NAME}" = "dfx" && test -f /etc/debian_version'

run:
	docker run --rm -it $(DOCKER_IMAGE):$(TAG) /bin/bash

build-sid: VERSION=sid
build-sid: TAG=sid
build-sid: build # dev

build-bookworm: VERSION=bookworm
build-bookworm: TAG=bookworm
build-bookworm: build # 12

build-bookworm-slim: VERSION=bookworm
build-bookworm-slim: TAG=bookworm-slim
build-bookworm-slim: DOCKERFILE=bookworm/Dockerfile.slim
build-bookworm-slim: build # 12

test-bookworm: TAG=bookworm
test-bookworm: test # 12

test-bookworm-slim: TAG=bookworm-slim
test-bookworm-slim: test # 12

run-bookworm: TAG=bookworm
run-bookworm: run # 12

run-bookworm-slim: TAG=bookworm-slim
run-bookworm-slim: run # 12

build-bullseye: VERSION=bullseye
build-bullseye: TAG=bullseye
build-bullseye: build # 11

build-bullseye-slim: VERSION=bullseye
build-bullseye-slim: TAG=bullseye-slim
build-bullseye-slim: DOCKERFILE=bullseye/Dockerfile.slim
build-bullseye-slim: build # 11

test-bullseye: TAG=bullseye
test-bullseye: test # 11

test-bullseye-slim: TAG=bullseye-slim
test-bullseye-slim: test # 11

run-bullseye: TAG=bullseye
run-bullseye: run # 11

run-bullseye-slim: TAG=bullseye-slim
run-bullseye-slim: run # 11

build-buster: VERSION=buster
build-buster: TAG=buster
build-buster: build # 10

build-stretch: VERSION=stretch
build-stretch: TAG=stretch
build-stretch: build # 9

build-jessie: VERSION=jessie
build-jessie: TAG=jessie
build-jessie: build # 8

build-wheezy: VERSION=wheezy
build-wheezy: TAG=wheezy
build-wheezy: build # 7

docker-build-sid: build-sid
docker-build-bookworm: build-bookworm
docker-build-bullseye: build-bullseye
docker-build-buster: build-buster
docker-build-stretch: build-stretch
docker-build-jessie: build-jessie
docker-build-wheezy: build-wheezy
