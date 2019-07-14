SHELL = /bin/bash
APP_NAME = go-docker

.PHONY: build run stop clean

build:
	docker build -t $(APP_NAME) .

run:
	docker run -d -p 8080:8080 -v ~/app-logs:/go-docker/logs --name $(APP_NAME) $(APP_NAME)

stop:
	docker container stop $(APP_NAME)

clean:
	docker rm $(APP_NAME)
	docker rmi $(APP_NAME)
	docker image prune -f