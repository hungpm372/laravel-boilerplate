DOCKER_COMPOSE_FILE = docker-compose.yml
DOCKER_IMAGE_VERSION = 3.8

all: up

up:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

build:
	docker-compose -f $(DOCKER_COMPOSE_FILE) build --no-cache

pull:
	docker-compose -f $(DOCKER_COMPOSE_FILE) pull

restart:
	docker-compose -f $(DOCKER_COMPOSE_FILE) restart

logs:
	docker-compose -f $(DOCKER_COMPOSE_FILE) logs -f

ps:
	docker-compose -f $(DOCKER_COMPOSE_FILE) ps

clean:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down -v --rmi all --remove-orphans

.PHONY: all up down build pull restart logs ps clean
