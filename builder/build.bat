@echo off

pushd opt\vmangos
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
popd

docker build --tag vmangos_builder:latest --rm --force-rm .
docker run --name vmangos_builder -v %CD%\opt\core:/opt/core -v %CD%\opt\vmangos:/opt/vmangos:rw -v %CD%\opt\ccache:/opt/ccache -v %CD%\opt\build:/opt/build --rm vmangos_builder
