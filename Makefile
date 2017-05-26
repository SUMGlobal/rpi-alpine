DOCKER_IMAGE_VERSION=3.4
DOCKER_IMAGE_NAME=sumglobal/rpi-alpine
DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

default: build

build:
	docker run --rm --privileged multiarch/qemu-user-static:register --reset
	curl -L -o qemu-arm-static.tar.gz https://github.com/multiarch/qemu-user-static/releases/download/v2.6.0/qemu-arm-static.tar.gz && tar xzf qemu-arm-static.tar.gz
	docker build --no-cache -t $(DOCKER_IMAGE_TAGNAME) .

push:
	docker push $(DOCKER_IMAGE_TAGNAME)
	docker push $(DOCKER_IMAGE_NAME)

