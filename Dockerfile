# Start from golang v1.12
FROM golang:1.12 as builder

LABEL maintainer="Strongbrent"

# Set the Current Working Directory inside the container
WORKDIR /go/src/github.com/callicoder/go-docker

# Copy everything to PWD in container
COPY . .

# Download all deps
RUN go get -d -v ./...

# Build the GO app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /go/bin/go-docker .


# --- Start a new stage from scratch -------------------------------------
FROM alpine:latest

RUN apk --no-cache add ca-certificates

# App ARGS
ARG APP_NAME=go-docker
ARG LOG_DIR=/${APP_NAME}/logs

# Create Log Directory
RUN mkdir -p ${LOG_DIR}

# ENV Vars
ENV LOG_FILE_LOCATION=${LOG_DIR}/app.log

# Set current working dir
WORKDIR /root/

# Copy Go binary from the previous stage
COPY --from=builder /go/bin/go-docker .

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Declare vols to mount
VOLUME ["/go-docker/logs"]

# Run the executable
CMD ["./go-docker"]
