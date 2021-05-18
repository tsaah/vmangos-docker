@echo off

docker exec -it database "/docker-entrypoint-initdb.d/update-migrations.sh"