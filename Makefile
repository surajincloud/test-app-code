# Go variables
GOCMD := go
GOBUILD := $(GOCMD) build
GOTEST := $(GOCMD) test

# Docker variables
DOCKER_IMAGE_NAME := app
DOCKER_IMAGE_TAG := latest
DOCKER_BUILD_CMD := docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) .

# Build the Go binary
build:
	$(GOBUILD) -o myapp ./main.go

# Test the Go binary
test:
	$(GOTEST) ./...

# Build the Docker image
docker:
	$(DOCKER_BUILD_CMD)

# Default target
all: build test docker

.PHONY: build test docker all
