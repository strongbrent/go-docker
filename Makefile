SHELL = /bin/bash
APP_NAME = go-docker

.PHONY: test build run curl-test stop clean

test:
	go test -v

build:
	docker build -t $(APP_NAME) .

run:
	docker run -d -p 8080:8080 -v ~/app-logs:/go-docker/logs --name $(APP_NAME) $(APP_NAME)

curl-test:
	curl http://localhost:8080?name=Brent

stop:
	docker container stop $(APP_NAME)

clean:
	docker rm $(APP_NAME)
	docker rmi $(APP_NAME)
	docker image prune -f