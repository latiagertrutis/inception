include ./srcs/.env

COMPOSE_ROOT = ./srcs

up:
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk up

up-build:
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk up-build

down:
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk down

domain:
	grep -q "$(DOMAIN)" /etc/hosts || echo "127.0.0.1 $(DOMAIN)" >> /etc/hosts

clean:
	sudo rm -rf $(WORDPRESS_VOLUME) $(MARIADB_VOLUME) $(STATIC_SITE_VOLUME)
	docker image rm -f nginx mariadb wordpress redis ftp mail
	docker container rm -f nginx mariadb wordpress redis ftp mail
	docker network remove $(NETWORK_NAME) -f

.PHONY: up up-build down domain clean
