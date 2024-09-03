#https://medium.com/@ssterdev/inception-guide-42-project-part-i-7e3af15eb671
#https://docs.docker.com/compose/use-secrets/

COMPOSE			:= ./srcs/docker-compose.yml
DATADIR			:= ~/data/
IMAGES			:= nginx:42 wordpress:42 mariadb:42
VOLUMES			:= mariadb wordpress

all : up

up : $(DATADIR)
	@docker-compose -f $(COMPOSE) up -d

$(DATADIR) :
	@echo Creating Database.
	@mkdir $(DATADIR)
	@mkdir $(DATADIR)/wordpress
	@mkdir $(DATADIR)/mariadb

clean :
	@echo Cleaning volumes.
	@docker volume rm $(VOLUMES)
	@echo Cleaning Database.
	@sudo rm -r $(DATADIR)
	@echo Cleaning docker images.
	@docker rmi $(IMAGES)

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