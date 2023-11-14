IMAGE_NAME := kong-tini-warp
IMAGE_TAG := latest
DOCKERFILE := Dockerfile

# Build the Docker image
build:
	@echo "Building Docker image..."
	docker build --progress=plain --no-cache -t $(IMAGE_NAME):$(IMAGE_TAG) -f $(DOCKERFILE) .

# Run the Docker image
run:
	@echo "Running Docker image..."
	docker-compose up -d

down:
	@echo "Cleaning Docker image..."
	docker-compose down

clean:
	@echo "Cleaning Docker image..."
	docker-compose down
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG)

# Makefile 默认目标
all: build run

.PHONY: build run all down clean
