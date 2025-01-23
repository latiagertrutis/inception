COMPOSE_ROOT = ./srcs
WORDPRESS = $(COMPOSE_ROOT)/requirements/wordpress/wordpress

up: $(WORDPRESS)
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk up

down:
	@$(MAKE) -C $(COMPOSE_ROOT) -f compose.mk down

$(WORDPRESS):
	@wget https://wordpress.org/latest.tar.gz
	@tar -C $(dir $(WORDPRESS))  -zxvf latest.tar.gz
	@cp ./srcs/requirements/wordpress/wp-config.php $(WORDPRESS)

.INTERMEDIATE: ./latest.tar.gz

.PHONY: up down
