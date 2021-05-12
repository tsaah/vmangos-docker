# vmangos-docker
docker for vmangos

1. clone it somewhere
2. put maps mmaps vmaps and 5875(or one you need) dbc extracted data into ```data``` folder (you can just use data from bropack)
3. edit ```config.env``` to suite your needs (or leave it as it is)
4. edit ```realmd/opt/vmangos/etc/realmd.conf``` (or leave it as it is)
5. edit ```mangosd/opt/vmangos/etc/mangosd.conf``` (or leave it as it is)
6. run ```update.bat```
7. you can interact with mangosd console by running ```docker attach mangosd```
8. repeat step 7 any time vmangos has updates

if you want to start from scratch with your realm/characters you can 'reset' database by calling ```database\remove-database-data.bat```

caviats:
	- no autosave scripts yet
	- no automated db dumps yet
	- no linux update script yet
	- no wowmap yet
	- no wowsimleregistration yet
