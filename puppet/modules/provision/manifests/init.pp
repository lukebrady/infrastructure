class provision {	
  $base_package = ['zsh','strace','perf','htop','bind-utils','ntpd']
  
  package { 'epel-release':
    ensure => present,
  }

  package { $base_packages :
    ensure => present,
  }
}
