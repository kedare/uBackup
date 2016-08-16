cd $backup_root

echo " --- Backing and compressing logs"
mkdir -p homes
cd /var/log/

logs=(
        "/var/log/apache2*"
        "/var/log/nginx*"
        "/var/log/syslog*"
        "/var/log/messages*"
        "/var/log/daemon*"
        "/var/log/kern*"
        "/var/log/dpkg*"
        "/var/log/apt*"
        "/var/log/fail2ban*"
       	"/var/log/postgresql*"
)

for log in "${logs[@]}"
do
        echo " ----- Copying $log"
        cp -r $log $backup_root/logs/
done

echo " ----- Compressing"
gunzip $backup_root/logs/*.gz
xz -9 $backup_root/logs/*

cd $box_root
