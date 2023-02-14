.PHONY: help
help: ## Show all Makefile targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


check: ## Run cookstyle on all cookbooks
	cookstyle cookbooks

fix: ## Fix all cookstyle issues on all cookbooks
	cookstyle -a cookbooks

example: ## Run the example cookbook
	chef-client -z -o example


