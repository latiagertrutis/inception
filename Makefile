include ./srcs/variables.env

COMPOSE_ROOT = ./srcs

up:
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk up

down:
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk down

domain:
	grep -q "$(DOMAIN)" /etc/hosts || echo "127.0.0.1 $(DOMAIN)" >> /etc/hosts

.PHONY: up down
