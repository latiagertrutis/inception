include ./srcs/.env

COMPOSE_ROOT = ./srcs
DEPENDENCIES = docker.io

up: domain dependencies
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk up

up-build: domain dependencies
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk up-build

down:
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk down

domain:
	if ! grep -q "$(DOMAIN)" /etc/hosts; then \
		sudo echo "127.0.0.1 $(DOMAIN)" >> /etc/hosts; \
	fi

dependencies:
	if { command -v apt && command -v dpkg-query; } >/dev/null; then \
		if ! dpkg-query -W $(DEPENDENCIES) >/dev/null; then \
			sudo apt-get update; \
			sudo apt-get install -y --no-install-recommends $(DEPENDENCIES); \
		fi \
	else \
		echo "apt not available, install dependencies manually!"; \
	fi

clean:
	sudo rm -rf $(WORDPRESS_VOLUME) $(MARIADB_VOLUME) $(STATIC_SITE_VOLUME)
	docker image rm -f nginx mariadb wordpress redis ftp mail
	docker container rm -f nginx mariadb wordpress redis ftp mail
	docker network remove $(NETWORK_NAME) -f

.PHONY: up up-build down domain clean
