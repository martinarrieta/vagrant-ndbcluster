
class ndbcluster( $ndbversion="7.3.2-1" ) {

  Package {
    provider => 'rpm',
    ensure => "installed",
  }
  
  define ndbpackages {
    file {
      "/tmp/MySQL-Cluster-${title}-gpl-${ndbversion}.el6.x86_64.rpm":
        source => "puppet:///ndbcluster/rpms/MySQL-Cluster-${title}-gpl-${ndbversion}.el6.x86_64.rpm",
    }
    package {
      "MySQL-Cluster-${title}-gpl":
      alias => "MySQL-Cluster-${title}",
      source => "/tmp/MySQL-Cluster-${title}-gpl-${ndbversion}.el6.x86_64.rpm",
      require  => File["/tmp/MySQL-Cluster-${title}-gpl-${ndbversion}.el6.x86_64.rpm"],
      
    }
  }
  ndbpackages { ["shared", "shared-compat", "client", "server"]: }
}