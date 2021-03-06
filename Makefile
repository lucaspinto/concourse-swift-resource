BUILD_IMAGE := databus23/gobuild:1.6
IMAGE       := databus23/concourse-swift-resource
build:
	docker run --rm -v $(CURDIR):/build -w /build $(BUILD_IMAGE) gb build -f -ldflags="-w -s"
	docker build --rm -t $(IMAGE) $(DOCKER_BUILD_OPTS) .

.PHONY: test
test:
	go vet ./src/...
	golint ./src/...
	gb test
