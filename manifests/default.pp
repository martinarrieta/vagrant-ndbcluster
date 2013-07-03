# -*- mode: ruby -*-
# vi: set ft=ruby :

node default {
  
  include ndbcluster
  
  service { "iptables":
    enable => false,
    ensure => stopped,
  }
  
  ssh_authorized_key{ root: 
    user => "root",
    ensure => present, 
    type => "ssh-rsa", 
    key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQC/Ls13aSjFHv5O4rGWBOBW+w3G7vbomy6EaqjM+ppG3LWX7rb8v7Tj9XS/Zz3cFYRYjgskOWgq7soJ21Tqz5HY5ie79TlG8s7DZhSl0JQso3+/gzn9pGWwBf2cbbuvB394AZK7g4FtTqJhjL75y6Z5hmTRJKAKkJjTD1y5EcNWZVrneimZK4Vx6ufjAG1joDGg/OyzJhz72+SoqDB6PCGtcsWr866PQ0X8hbRqplypvH1xlrQHxtO7TeodSLEWLVF7VrzLuqKU1pYui9lFisqHhkuNWZaN6lecxiNfXxbf22+/Q1x2CHg/Eu4Owsu8f3vgx+nHb2xkL18csuhzI4Xn", 
    name => "root", 
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
