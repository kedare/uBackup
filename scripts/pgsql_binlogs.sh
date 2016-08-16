cd $backup_root

echo " --- Backing up PostgreSQL databases"
mkdir -p pgsql/binlogs
cp -r /var/lib/postgresql/archive/wal/* pgsql/binlogs/

cd $box_root
