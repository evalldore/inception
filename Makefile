COMPOSE			:= ./srcs/docker-compose.yml

all : up

up :
	@docker-compose -f $(COMPOSE) up -d

down :
	@docker-compose -f $(COMPOSE) down
	@docker rmi nginx:42
	@docker rmi wordpress:42

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