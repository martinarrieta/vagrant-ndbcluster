class ndbcluster::datanode {
  
  
  file { "/var/lib/mysql-cluster":
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => 700,
  }
  
  file { "/etc/my.cnf":
      ensure  => file,
      owner   => root,
      group   => root,
      mode    => 644,
      content => template("ndbcluster/my.cnf.data.erb"),
      require => [ Package["MySQL-Cluster-server"]],
  }
  
  exec { "initialize_ndb":
      command => "/usr/sbin/ndbd --initial && /bin/touch /var/lib/mysql-cluster/initialized ",
      onlyif => ["/usr/bin/test ! -f /var/lib/mysql-cluster/initialized","/usr/bin/test ! `/sbin/pidof ndbd`"],
      require => [ Package["MySQL-Cluster-server"],File["/var/lib/mysql-cluster"],File["/etc/my.cnf"] ],
  }
  
  exec { "start_ndb":
      command => "/usr/sbin/ndbd",
      onlyif => ["/usr/bin/test -f /var/lib/mysql-cluster/initialized", "/usr/bin/test ! `/sbin/pidof ndbd`"],
      require => [ Package["MySQL-Cluster-server"],File["/var/lib/mysql-cluster"],File["/etc/my.cnf"] ],
  }
  
}