vagrant-ndbcluster
==================


This is a [Vagrant](http://www.vagrantup.com/) file that create a 3 nodes NDB cluster

Nodes
=====

mgmsqlnode - (192.168.71.101)
- ndb_mgmd

datanode1 - (192.168.71.102)
- ndbd

datanode2 - (192.168.71.103)
- ndbd


Startup the cluster
===================


Download the RPMs
-----------------

	shell> sh download_rpms.sh


Start vagrant
-------------

	shell> vagrant up


Connect to the mgmsqlnode
-------------------------

	vagrant ssh mgmsqlnode

Reset the root password
-----------------------

Since this is based MySQL 5.6 you have to set the root password the fist time. More information about this 
[Here](http://dev.mysql.com/doc/refman/5.6/en/default-privileges.html)

	shell> cat /root/.mysql_secret
	# The random password set for the root user at Wed Jul  3 18:38:30 2013 (local time): SDFe323

Then use this password to connect to the mysql server and set the new password:

	shell> mysql -u root -p
	mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('newpwd');

Check status
------------

	# ndb_mgm
	-- NDB Cluster -- Management Client --
	ndb_mgm> show
	Connected to Management Server at: 192.168.71.101:1186
	Cluster Configuration
	---------------------
	[ndbd(NDB)]	2 node(s)
	id=2	@192.168.71.102  (mysql-5.6.11 ndb-7.3.2, Nodegroup: 0, Master)
	id=3	@192.168.71.103  (mysql-5.6.11 ndb-7.3.2, Nodegroup: 0)
	
	[ndb_mgmd(MGM)]	1 node(s)
	id=1	@192.168.71.101  (mysql-5.6.11 ndb-7.3.2)
	
	[mysqld(API)]	2 node(s)
	id=4	@192.168.71.101  (mysql-5.6.11 ndb-7.3.2)
	id=5 (not connected, accepting connect from any host)

Enjoy! :)
