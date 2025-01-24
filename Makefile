COMPOSE_ROOT = ./srcs

up:
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk up

down:
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk down

.PHONY: up down
