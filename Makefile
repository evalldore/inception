#https://medium.com/@ssterdev/inception-guide-42-project-part-i-7e3af15eb671
#https://docs.docker.com/compose/use-secrets/

COMPOSE			:= ./srcs/docker-compose.yml
DATADIR			:= ~/data/
SECRETSDIR		:= ./secrets/
IMAGES			:= nginx:42 wordpress:42 mariadb:42
VOLUMES			:= mariadb wordpress
HOST			:= '127.0.0.1	evallee-.42.fr'
SECRETS			:= wp_user wp_user_password wp_user_email wp_admin wp_admin_password wp_admin_email \
db_user db_user_password db_root_password

all : up

up : $(DATADIR)
	@docker compose -f $(COMPOSE) up -d

$(DATADIR) :
	@echo Creating Database.
	@mkdir $(DATADIR)
	@mkdir $(addprefix $(DATADIR), $(VOLUMES))

secrets :
	@echo Creating secrets.
	@mkdir $(SECRETSDIR)
	@touch $(addprefix $(SECRETSDIR), $(SECRETS))

clean :
	@echo Cleaning volumes.
	@sudo docker volume rm $(VOLUMES)
	@echo Cleaning Database.
	@sudo rm -r $(DATADIR)
	@echo Cleaning docker images.
	@sudo docker rmi $(IMAGES)

host :
	@if grep -q $(HOST) '/etc/hosts';\
	then\
		echo "Host already configured!";\
	else\
		echo "Adding host!";\
		sudo -E sh -c 'echo $(HOST) >> /etc/hosts';\
	fi

down :
	@docker compose -f $(COMPOSE) down

stop :
	@docker compose -f $(COMPOSE) stop

start :
	@docker compose -f $(COMPOSE) start

logs :
	@docker compose -f $(COMPOSE) logs --tail 5

validate :
	@docker compose -f $(COMPOSE) config

status :
	@docker ps