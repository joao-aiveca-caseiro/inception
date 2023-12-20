DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

build:
	@if [ ! -d "/home/jaiveca-/data/" ]; then \
		mkdir /home/jaiveca-/data /home/jaiveca-/data/wordpress /home/jaiveca-/data/mariadb; \
	fi
	docker compose -f $(DOCKER_COMPOSE_FILE) build

run:
	docker compose -f $(DOCKER_COMPOSE_FILE) up

clean:
	docker compose -f $(DOCKER_COMPOSE_FILE) down --volume --rmi all
	docker rmi $$(docker images -q) || true

fclean: clean
	docker system prune -f

ultraclean: fclean
	cd /home/jaiveca- rm -rf data