export DESTINATION_HOST=
export DESTINATION_USER=backup
export DESTINATION_PORT=22

mkdir -p $backup_root

echo "$(date) > Starting backup"
echo " -- Preparing backup in $backup_root"

#source $backup_box/scripts/pgsql_dumps.sh
#source $backup_box/scripts/pgsql_binlogs.sh
#source $backup_box/scripts/atlassian.sh
source $backup_box/scripts/homes.sh
source $backup_box/scripts/logs.sh

echo "$(date) > Ended preparation, now pushing to remote"
if scp -P $DESTINATION_PORT -r $deposit_root $DESTINATION_USER@$DESTINATION_HOST:`hostname`; then
  echo "$(date) > All good, deleting deposit"
  rm -rf $deposit_root
else
  echo "$(date) > Failed to push backup, keeping it"
fi
echo "$(date) > Ended backup push"
