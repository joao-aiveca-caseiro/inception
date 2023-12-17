DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

build:
	docker compose -f $(DOCKER_COMPOSE_FILE) build

run:
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d