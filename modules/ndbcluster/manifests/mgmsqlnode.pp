class ndbcluster::mgmsqlnode {
  
  
  file { "/usr/mysql-cluster":
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => 700,
  }
  
  file { "/usr/mysql-cluster/config.ini":
      ensure  => file,
      owner   => root,
      group   => root,
      mode    => 644,
      content => template("ndbcluster/config.ini.mgmsql.erb"),
      require => [ Package["MySQL-Cluster-server"],File["/usr/mysql-cluster"] ],
  }
  
  file { "/etc/my.cnf":
      ensure  => file,
      owner   => root,
      group   => root,
      mode    => 644,
      content => template("ndbcluster/my.cnf.data.erb"),
      require => [ Package["MySQL-Cluster-server"]],
  }
  
  exec { "start_ndb_mgmd":
      command => "/usr/sbin/ndb_mgmd -f /usr/mysql-cluster/config.ini",
      onlyif => "/usr/bin/test ! `/sbin/pidof ndb_mgmd`",
      require => [ Package["MySQL-Cluster-server"],File["/usr/mysql-cluster/config.ini"] ],
  }
  
  service { "mysql":
    enable => true,
    ensure => running,
    require => [Exec["start_ndb_mgmd"], File["/etc/my.cnf"]]
  }
  
}