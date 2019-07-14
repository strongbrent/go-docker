SHELL = /bin/bash

.PHONY: build run stop clean

build:
	docker build -t go-docker .

run:
	docker run -d -p 8080:8080 --name go-docker go-docker

stop:
	docker container stop go-docker

clean:
	(docker rm go-docker && docker rmi go-docker)