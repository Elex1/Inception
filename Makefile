
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

all : build

build :
	mkdir -p /home/melghoud/data/wordpress
	mkdir -p /home/melghoud/data/mariadb
	docker-compose -f ${DOCKER_COMPOSE_FILE} build
up :
	docker-compose -f ${DOCKER_COMPOSE_FILE} up 

down:
	docker-compose -f ${DOCKER_COMPOSE_FILE} down --volumes
