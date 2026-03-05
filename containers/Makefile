# Makefile to build Nautobot container
# Author: Benjamin P. Trachtenberg
# Version: 2026.3.5.001

.PHONY: build-podman-temporal build-docker-temporal

info:
	@echo "make options"
	@echo "    build-temporal-nautobot             To build the container in podman"
	@echo "    build-temporal-nautobot             To build the container in docker"

build-podman-temporal:
	@echo "Building the temporal container with container_version=$(container_version) in podman"
	@podman build --tag temporal:latest --tag temporal:$(container_version) -f Containerfile --format docker

build-docker-temporal:
	@echo "Building the temporal container with container_version=$(container_version) in docker"
	@docker build --tag temporal:latest --tag temporal:$(container_version) -f Containerfile .
