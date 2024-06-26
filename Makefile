# The default goal that will be run when `make` is executed without arguments.
.DEFAULT_GOAL := help

# Display help information for each target.
.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  build          Build the Docker images"
	@echo "  up             Build and start the Docker containers"
	@echo "  down           Stop and remove the Docker containers"
	@echo "  logs           Display logs of the Docker containers"
	@echo "  clean          Remove all Docker containers, images, and volumes"
	@echo "  prune          Clean up Docker system resources"
	@echo "  rebuild        Rebuild the Docker images without using the cache"
	@echo "  restart        Restart the Docker containers"
	@echo "  pull-images    Manually pull Docker images"

# Build the Docker images.
.PHONY: build
build:
	docker-compose build

# Build and start the Docker containers.
.PHONY: up
up: .env
	docker-compose up --build

# Stop and remove the Docker containers.
.PHONY: down
down:
	docker-compose down

# Display logs of the Docker containers.
.PHONY: logs
logs:
	docker-compose logs

# Remove all Docker containers, images, and volumes.
.PHONY: clean
clean:
	docker-compose down --rmi all --volumes --remove-orphans

# Clean up Docker system resources.
.PHONY: prune
prune:
	docker system prune -a --volumes

# Rebuild the Docker images without using the cache.
.PHONY: rebuild
rebuild:
	docker-compose build --no-cache

# Restart the Docker containers.
.PHONY: restart
restart:
	docker-compose down
	docker-compose up --build

# Manually pull Docker images to ensure they are available.
.PHONY: pull-images
pull-images:
	docker pull httpd:2.4
	docker pull php:8.0-fpm
	docker pull andyshinn/dnsmasq:2.78

# Ensure .env file exists
.PHONY: .env
.env:
	if [ ! -f .env ]; then echo "Please create a .env file with the required environment variables"; exit 1; fi
	