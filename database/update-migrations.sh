#!/bin/bash

echo "=> applying migrations..."
cd /opt/sql/migrations/ && chmod +x merge.sh && ./merge.sh
[ -f /opt/sql/migrations/world_db_updates.sql ] && mysql -u mangos -pmangos mangos < /opt/sql/migrations/world_db_updates.sql
[ -f /opt/sql/migrations/characters_db_updates.sql ] && mysql -u mangos -pmangos characters < /opt/sql/migrations/characters_db_updates.sql
[ -f /opt/sql/migrations/logon_db_updates.sql ] && mysql -u mangos -pmangos realmd < /opt/sql/migrations/logon_db_updates.sql
[ -f /opt/sql/migrations/logs_db_updates.sql ] && mysql -u mangos -pmangos logs < /opt/sql/migrations/logs_db_updates.sql
cd /opt/sql/migrations/ && rm -f world_db_updates.sql characters_db_updates.sql logon_db_updates.sql logs_db_updates.sql