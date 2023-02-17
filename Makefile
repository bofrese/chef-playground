IMAGE_NAME=chef-playground
CONTAINER_NAME=chef-playground

.PHONY: help
help: ## Show all Makefile targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build the Docker image
	docker build --platform linux/amd64 -t $(IMAGE_NAME) .

run: build ## Run the Docker container
	docker run --platform linux/amd64 --name $(CONTAINER_NAME) -v "$(PWD):/chef" -v /var/run/docker.sock:/var/run/docker.sock  -d $(IMAGE_NAME)

connect: start ## Connect to the Docker container
	docker exec -it $(CONTAINER_NAME) /bin/bash

stop: ## Stop the Docker container
	docker stop $(CONTAINER_NAME)

start: ## Stop the Docker container
	docker start  $(CONTAINER_NAME)

remove: stop ## Remove the Docker container
	docker rm $(CONTAINER_NAME)

clean: remove ## Remove the Docker image
	docker rmi $(IMAGE_NAME)


