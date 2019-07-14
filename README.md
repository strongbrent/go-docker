# go-docker

[![Build Status](https://travis-ci.org/strongbrent/go-docker.svg?branch=master)](https://travis-ci.org/strongbrent/go-docker)

Proof of concept for running a Go web service using Docker multi-stage builds.

Based on this [blog](https://www.callicoder.com/docker-golang-image-container-example/) post created by [Rajeev Singh](https://github.com/callicoder).

## Requirements
| Requirement | My Version | 
| ----------- | ------- |  
|[Docker](https://docs.docker.com/install/)|18.06.1-ce|
|[Golang](https://github.com/callicoder)|1.12|
|[go-dep](https://github.com/golang/dep)|0.5.0|

## Getting Started
If you are developing locally, then you can use `dep` to install the dependencies for this project. (See the link above for `dep` installation instructions.) Then you can build and run the app locally as follows:
```
cd $GOPATH/src/github.com/<your_account>
git clone https://github.com/strongbrent/go-docker.git
cd go-docker
dep init
go build
./go-docker
```