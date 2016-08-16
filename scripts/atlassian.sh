cd $backup_root

echo " --- Backing and compressing Atlassian data"
mkdir -p atlassian
cd /var/atlassian/application-data/
for product in *
do
       	echo " ----- Processing $product"
       	tar -cJf $backup_root/atlassian/$product.txz $product
done

cd $box_root
