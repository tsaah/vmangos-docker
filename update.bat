@echo off

git pull --stat --summary --progress --jobs=8
git submodule update --init --remote --recursive --jobs=8
git submodule status

docker compose up -d

pushd builder

call build.bat

call install.bat

popd

docker restart mangosd realmd
docker compose ps