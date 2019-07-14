FROM golang:1.11
LABEL maintainer="Strongbrent"

WORKDIR $GOPATH/src/github.com/strongbrent/go-docker

COPY . .

# Download all deps
RUN go get -d -v ./...

# Install the package
RUN go install -v ./...

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["go-docker"]
