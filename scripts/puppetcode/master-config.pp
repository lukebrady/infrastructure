$packages = ["epel-release", "vim", "htop"]

user { 'luke':
    comment => 'Luke Brady',
    home => '/home/luke',
    ensure=> present,
    shell => '/bin/bash',
    uid => '1001',
}

file { 'name':
    ensure => file,
    owner  => owner,
    group  => group,
    mode   => mode,
    source => 'puppet:///modules/class/file.txt';
}

package { $packages:
    ensure => installed,
    provider => "yum",
}
