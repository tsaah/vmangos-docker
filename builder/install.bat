@echo off

IF EXIST "opt\vmangos\etc\realmd.conf.dist" (
	IF EXIST "..\realmd\opt\vmangos\etc\realmd.conf.dist" (
		del /q /f ..\realmd\opt\vmangos\etc\realmd.conf.dist
	)
	copy /y opt\vmangos\etc\realmd.conf.dist ..\realmd\opt\vmangos\etc\realmd.conf.dist
)

IF EXIST "opt\vmangos\etc\mangosd.conf.dist" (
	IF EXIST "..\mangosd\opt\vmangos\etc\mangosd.conf.dist" (
		del /q /f ..\mangosd\opt\vmangos\etc\mangosd.conf.dist
	)
	copy /y opt\vmangos\etc\mangosd.conf.dist ..\mangosd\opt\vmangos\etc\mangosd.conf.dist
)

IF EXIST "opt\vmangos\bin\realmd" (
	IF EXIST "..\realmd\opt\vmangos\bin\realmd" (
		del /q /f ..\realmd\opt\vmangos\bin\realmd
	)
	copy /y opt\vmangos\bin\realmd ..\realmd\opt\vmangos\bin\realmd
)

IF EXIST "opt\vmangos\bin\mangosd" (
	IF EXIST "..\mangosd\opt\vmangos\bin\mangosd" (
		del /q /f ..\mangosd\opt\vmangos\bin\mangosd
	)
	copy /y opt\vmangos\bin\mangosd ..\mangosd\opt\vmangos\bin\mangosd
)
