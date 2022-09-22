IMAGE_NAME=monkit
IMAGE_TAG=latest

GIT_COMMIT=`git rev-parse HEAD`
GIT_TAG=`git tag --points-at HEAD`

.PHONY: build
build:
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} --build-arg GIT_COMMIT=${GIT_COMMIT} \
	--build-arg GIT_TAG=${GIT_TAG} .
