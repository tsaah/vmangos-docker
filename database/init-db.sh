#!/bin/bash

pushd /opt/database

echo " => updating database..."
mysql_upgrade -u root -p$MYSQL_ROOT_PASSWORD

echo " => extracting world data..."
7z e -y $WORLD.7z

echo " => creating tables..."
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS realmd DEFAULT CHARSET utf8 COLLATE utf8_general_ci;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS characters DEFAULT CHARSET utf8 COLLATE utf8_general_ci;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS mangos DEFAULT CHARSET utf8 COLLATE utf8_general_ci;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS logs DEFAULT CHARSET utf8 COLLATE utf8_general_ci;"

echo " => initializing tables..."
mysql -u root -p$MYSQL_ROOT_PASSWORD realmd < /opt/sql/logon.sql
mysql -u root -p$MYSQL_ROOT_PASSWORD logs < /opt/sql/logs.sql
mysql -u root -p$MYSQL_ROOT_PASSWORD mangos < /opt/database/$WORLD.sql
mysql -u root -p$MYSQL_ROOT_PASSWORD characters < /opt/sql/characters.sql

echo " => creating user..."
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER 'mangos'@'localhost' IDENTIFIED BY 'mangos';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "SET PASSWORD FOR 'mangos'@'localhost' = PASSWORD('mangos');"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'mangos'@'%' IDENTIFIED BY 'mangos';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON realmd.* TO mangos@'localhost' WITH GRANT OPTION;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON characters.* TO mangos@'localhost' WITH GRANT OPTION;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON mangos.* TO mangos@'localhost' WITH GRANT OPTION;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON logs.* TO mangos@'localhost' WITH GRANT OPTION;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

echo " => applying migrations..."
cd /opt/sql/migrations/ && chmod +x merge.sh && ./merge.sh
[ -f /opt/sql/migrations/world_db_updates.sql ] && mysql -u mangos -pmangos mangos < /opt/sql/migrations/world_db_updates.sql
[ -f /opt/sql/migrations/characters_db_updates.sql ] && mysql -u mangos -pmangos characters < /opt/sql/migrations/characters_db_updates.sql
[ -f /opt/sql/migrations/logon_db_updates.sql ] && mysql -u mangos -pmangos realmd < /opt/sql/migrations/logon_db_updates.sql
[ -f /opt/sql/migrations/logs_db_updates.sql ] && mysql -u mangos -pmangos logs < /opt/sql/migrations/logs_db_updates.sql
cd /opt/sql/migrations/ && rm -f world_db_updates.sql characters_db_updates.sql logon_db_updates.sql logs_db_updates.sql

rm -f /opt/database/$WORLD.sql

popd