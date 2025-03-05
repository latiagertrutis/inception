include ./srcs/.env

COMPOSE_ROOT = ./srcs
DEPENDENCIES =	firefox ca-certificates curl

up: domain
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk up

up-build: domain
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk up-build

down:
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk down

domain:
	@echo "Adding to $(DOMAIN) /etc/hosts..."
	if ! grep -q "$(DOMAIN)" /etc/hosts; then \
		echo "127.0.0.1 $(DOMAIN)" | sudo tee -a /etc/hosts; \
	fi

vm-dependencies:
	@echo "Installing required dependencies for the vm"
	if { command -v apt && command -v dpkg-query; } >/dev/null; then \
		sudo apt-get update; \
		sudo apt-get install -y --no-install-recommends $(DEPENDENCIES); \
		sudo install -m 0755 -d /etc/apt/keyrings; \
		sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc; \
		sudo chmod a+r /etc/apt/keyrings/docker.asc; \
		echo "deb [arch=$$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $$(. /etc/os-release && echo "$${UBUNTU_CODENAME:-$$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null; \
		sudo apt-get update; \
		sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin; \
		sudo systemctl enable docker --now; \
		sudo groupadd -f docker; \
		sudo usermod -aG docker $(USER); \
		@echo "User $(USER) added to docker group, logout for this to take efect!" ; \
	else \
		echo "apt not available, install dependencies manually!"; \
	fi

clean:
	sudo rm -rf $(WORDPRESS_VOLUME) $(MARIADB_VOLUME) $(STATIC_SITE_VOLUME)
	docker image rm -f nginx mariadb wordpress redis ftp mail
	docker container rm -f nginx mariadb wordpress redis ftp mail
	docker network remove $(NETWORK_NAME) -f

.PHONY: up up-build down domain clean
