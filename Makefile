IMAGE_NAME=chef-playground
CONTAINER_NAME=chef-playground
SSH_PORT=2022
SSH_USER=root
SSH_HOST=localhost

.PHONY: help
help: ## Show all Makefile targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build the Docker image
	docker build --platform linux/amd64 -t $(IMAGE_NAME) .

run: build ## Run the Docker container
	docker run --platform linux/amd64 --name $(CONTAINER_NAME) -v "$(PWD):/chef" -p $(SSH_PORT):22 -d $(IMAGE_NAME)

connect: ## Connect to the Docker container
	docker exec -it $(CONTAINER_NAME) /bin/bash

stop: ## Stop the Docker container
	docker stop $(CONTAINER_NAME)

start: ## Stop the Docker container
	docker start  $(CONTAINER_NAME)

remove: stop ## Remove the Docker container
	docker rm $(CONTAINER_NAME)

clean: stop ## Remove the Docker image
	docker rmi $(IMAGE_NAME)

ip: ## Find the IP of the image
	docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -q)

ssh: ## Connect to the Docker container using SSH
	ssh $(SSH_USER)@$(SSH_HOST) -p $(SSH_PORT)


