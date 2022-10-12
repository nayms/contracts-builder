.DEFAULT_GOAL := help

help:	## display this help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
.PHONY: help

build:	## build the container image
	docker build -t build-foundry .

run:	## run the image container interactivelly
	docker run --rm -it build-foundry
