#/bin/sh



packages="shared-compat server shared client"

cd modules/ndbcluster/files/rpms

for i in $packages; do
	wget http://cdn.mysql.com/Downloads/MySQL-Cluster-7.3/MySQL-Cluster-${i}-gpl-7.3.2-1.el6.x86_64.rpm
done
