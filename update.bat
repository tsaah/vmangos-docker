@echo off

git pull --stat --summary --progress
git submodule update --init --remote --recursive
git submodule status

docker compose up -d

pushd builder

call build.bat

call install.bat

popd

pushd database

call update-migrations.bat

popd

docker restart mangosd realmd
docker compose ps