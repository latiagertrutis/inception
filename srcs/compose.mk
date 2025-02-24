up:
	docker compose up --pull never

up-build:
	docker compose up --build --pull never

down:
	docker compose down

.PHONY: up up-build down
