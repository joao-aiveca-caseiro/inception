DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

build:
	@if [ ! -d "/home/jaiveca-/data/" ]; then \
		mkdir -p /home/jaiveca-/data/wordpress /home/jaiveca-/data/mariadb; \
	fi
	docker compose -f $(DOCKER_COMPOSE_FILE) build

run:
	docker compose -f $(DOCKER_COMPOSE_FILE) up

clean:
	docker compose -f $(DOCKER_COMPOSE_FILE) down --volume --rmi all
	docker stop $$(docker ps -qa) || true 
	docker rm $$(docker ps -qa) || true
	docker rmi -f $$(docker images -qa) || true
	docker volume rm $$(docker volume ls -q) || true
	docker network rm $$(docker network ls -q) || true

fclean: clean
	docker system prune -f

ultraclean: fclean
	cd /home/jaiveca- && sudo rm -rf data