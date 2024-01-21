DOCKER_COMPOSE_FILE = docker-compose.yml
SERVICES = auth-service db

prepare-env:
	@echo "Creating basic .env file..."
	cp .env.example .env

first-build:
	make prepare-env
	@echo "Building Docker containers..."
	docker-compose -f $(DOCKER_COMPOSE_FILE) build $(SERVICES) --no-cache

build:
	@echo "Building Docker containers..."
	docker-compose -f $(DOCKER_COMPOSE_FILE) build $(SERVICES) --no-cache

down:
	@echo "Removing Docker containers..."
	docker-compose down --remove-orphans -v

run:
	@echo "Starting Docker containers..."
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d $(SERVICES)

rebuild:
	@echo "Rebuilding Docker containers..."
	docker-compose -f $(DOCKER_COMPOSE_FILE) down --remove-orphans $(SERVICES)
	make build
	make run

start:
	make build
	make run

stop:
	make build
	make run

first-start:
	make first-build
	make run