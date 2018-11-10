$packages = ["epel-release", "vim", "htop"]

user { 'luke':
    comment => 'Luke Brady',
    home => '/home/luke',
    ensure=> present,
    shell => '/bin/bash',
    uid => '1001',
    gid => '1001'
}

file { '/home/luke':
    ensure => directory,
    owner  =>  '1001',
    group  => 'luke',
    mode   => '0700',
}

package { $packages:
    ensure => installed,
    provider => "yum",
}
