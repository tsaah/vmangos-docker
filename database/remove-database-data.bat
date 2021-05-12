@echo off

docker stop database
rd /q /s datadir
docker start database