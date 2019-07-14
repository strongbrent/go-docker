SHELL = /bin/bash

.PHONY: build-dev run-dev stop-dev clean-dev

build-dev:
	docker build -t go-docker .

run-dev:
	docker run -d -p 8080:8080 --name go-docker-dev go-docker

stop-dev:
	docker container stop go-docker-dev

clean-dev:
	(docker rm go-docker-dev && docker rmi go-docker)