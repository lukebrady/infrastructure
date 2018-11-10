#!/bin/bash

GREP_CMDS=( $(grep FACTER_rack /etc/profile),
			$(grep FACTER_cloud_provider /etc/profile)
			$(grep FACTER_region /etc/profile) )

if [[ $(whoami) != "root" ]]; then
        echo "This script must be run as root."
        exit 1
fi

# Check to see if the facts have already been added to the profile.
for cmd in ${GREP_CMDS[*]}
do
    if [[ $cmd -eq 0 ]]; then
        echo The facts have already been configured.
        exit 0
    fi
done

# If the running user is root, export the custom facts.
echo export FACTER_rack=rack_1 >> /etc/profile;
echo export FACTER_cloud_provider=azure >> /etc/profile;
echo export FACTER_region=east-us-1 >> /etc/profile;

# Now source the profile to update the facts.
source /etc/profile;

if [[ $? -eq 0 ]]; then
        exit 0;
else
        exit 1;
fi