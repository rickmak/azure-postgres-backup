GIT_SHA ?= $(shell git rev-parse --short=8 HEAD)

.PHONY: build
build:
	docker buildx build . -f Dockerfile \
		-t rickmak/azure-postgres-backup:$(GIT_SHA) \
		-t rickmak/azure-postgres-backup:latest


.PHONY: push-docker-hub
push-docker-hub:
	docker tag rickmak/azure-postgres-backup:$(GIT_SHA) \
		rickmak/azure-postgres-backup:latest
	docker push rickmak/azure-postgres-backup:$(GIT_SHA)
	docker push rickmak/azure-postgres-backup:latest
