$packages = ['vim', 'htop', 'perf', 'strace', 'lsof', 'iftop', 'bind-utils']
$services = ['sshd']

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

package { 'epel-release':
        ensure => installed,
        provider => 'yum',
}

package { $packages:
    ensure => installed,
    provider => 'yum',
}

service { $services:
        ensure => running,
        enable => true,
}

