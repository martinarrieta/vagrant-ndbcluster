# -*- mode: ruby -*-
# vi: set ft=ruby :

node default {
  
  include ndbcluster
  
  service { "iptables":
    enable => false,
    ensure => stopped,
  }
  
}


node mgmsqlnode inherits default {
  include ndbcluster::mgmsqlnode
}

node datanode1 inherits default {
  include ndbcluster::datanode
}

node datanode2 inherits default {
  include ndbcluster::datanode  
}
