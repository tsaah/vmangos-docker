@echo off

docker build --tag vmangos_builder:latest --rm --force-rm .
docker run --name vmangos_builder --env-file ../config.env -v %CD%\opt\core:/opt/core -v %CD%\opt\vmangos:/opt/vmangos:rw -v %CD%\opt\ccache:/opt/ccache -v %CD%\opt\build:/opt/build --rm vmangos_builder
