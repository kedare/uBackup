cd $backup_root

echo " --- Backing up PostgreSQL databases"
mkdir -p pgsql/dumps
chown -R postgres:postgres pgsql
for database in `sudo -u postgres psql -c "select datname from pg_database;" -t`
do
       	echo " ----- Backing up database $database"
       	sudo -u postgres pg_dump -Fd -j 4 $database -f pgsql/dumps/$database
done


cd $box_root
