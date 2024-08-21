#it has to build the Docker images using docker-compose.yml

COMPOSE			:= ./srcs/docker-compose.yml

all : up

up :
	@docker-compose -f $(COMPOSE) up -d

down :
	@docker-compose -f $(COMPOSE) down

stop :
	@docker-compose -f $(COMPOSE) stop

start :
	@docker-compose -f $(COMPOSE) start

logs :
	@docker-compose -f $(COMPOSE) logs --tail 5

validate :
	@docker-compose -f $(COMPOSE) config

status :
	@docker ps