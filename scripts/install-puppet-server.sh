#!/bin/bash

if [[ $(whoami) != "root" ]]; then
	echo "This script must be run as root.";
	exit 1;
fi

# Install the Puppet 6 Repo. This is for CentOS 7.
sudo rpm -Uvh https://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm
sudo yum install -y puppetserver puppet-agent
