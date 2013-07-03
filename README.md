vagrant-ndbcluster
==================


This is a vagrant file to create a 3 nodes NDB cluster

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

 sh download_rpms.sh


Start vagrant
-------------
 vagrant up


