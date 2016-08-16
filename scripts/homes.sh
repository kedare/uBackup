cd $backup_root

echo " --- Backing and compressing homes"
mkdir -p homes
cd /home/
for home in *
do
        echo " ----- Processing $home"
        tar -cJf $backup_root/homes/$home.txz $home
done

cd $box_root
