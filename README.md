# vmangos-docker
docker for vmangos

* it uses vmangos core from https://github.com/vmangos/core
* it uses vanilla database from https://github.com/brotalnia/database forked from LightsHope
* it uses warden modules from https://github.com/CW60/warden_modules
* it will use in the future playermap from https://github.com/azerothcore/playermap
* it will use in thr future WoWSimpleRegistration from https://github.com/masterking32/WoWSimpleRegistration

# how to
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
	* no autosave scripts yet
	* no automated db dumps yet
	* no linux update script yet
	* no playermap yet
	* no wowsimleregistration yet

if you don't like mine you can check out different docker by tonymmm1 here https://github.com/tonymmm1/vmangos-docker 