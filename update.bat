@echo off

rem git pull --stat --summary --progress --jobs=8
rem git submodule update --init --remote --recursive --jobs=8
rem git submodule status

rem docker compose up -d

rem pushd builder

rem build.bat

rem docker stop mangosd realmd

rem install.bat

rem popd

docker compose up -d
docker compose ps