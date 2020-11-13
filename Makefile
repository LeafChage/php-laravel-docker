LOCAL_DC=./docker/docker_compose/local.docker-compose.yaml

WEB_TAG=demo-web
DB_TAG=demo-db
APP_TAG=demo-app

WEB_CONTAINER=`docker ps | grep $(WEB_TAG) | awk '{print $$1}'`
DB_CONTAINER=`docker ps | grep $(DB_TAG) | awk '{print $$1}'`
APP_CONTAINER=`docker ps | grep $(APP_TAG) | awk '{print $$1}'`

run:
	make down.local; make up.local

down.local:
	docker-compose -f $(LOCAL_DC) down

up.local:
	docker-compose -f $(LOCAL_DC) up

exec.app:
	docker exec -it $(APP_CONTAINER) /bin/bash

exec.web:
	docker exec -it $(WEB_CONTAINER) /bin/bash

exec.db:
	docker exec -it $(DB_CONTAINER) /bin/bash
