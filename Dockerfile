FROM golang:1.11
LABEL maintainer="Strongbrent"

# Build ARGS
ARG APP_NAME=go-docker
ARG LOG_DIR=/${APP_NAME}/logs

# Create Log Directory
RUN mkdir -p ${LOG_DIR}

# ENV Vars
ENV LOG_FILE_LOCATION=${LOG_DIR}/app.log

# Set current working dir
WORKDIR $GOPATH/src/github.com/strongbrent/go-docker

# Copy everything to PWD in container
COPY . .

# Download all deps
RUN go get -d -v ./...

# Install the package
RUN go install -v ./...

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Declare vols to mount
VOLUME ["/go-docker/logs"]

# Run the executable
CMD ["go-docker"]
