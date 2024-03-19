DOCKER_IMAGE=dockette/debian

_docker-build-%: VERSION=$*
_docker-build-%:
	docker buildx \
		build \
		--pull \
		-t ${DOCKER_IMAGE}:${VERSION} \
		./${VERSION}

docker-build-sid: _docker-build-sid # dev
docker-build-bookworm: _docker-build-bookworm # 12
docker-build-bullseye: _docker-build-bullseye # 11
docker-build-buster: _docker-build-buster # 10
docker-build-stretch: _docker-build-stretch # 9
docker-build-jessie: _docker-build-jessie # 8
docker-build-wheezy: _docker-build-wheezy # 7
