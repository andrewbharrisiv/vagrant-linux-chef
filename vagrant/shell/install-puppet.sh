#!/usr/bin/env bash
#
# Ensure puppet client is installed on box

# Check if puppet installed
if hash puppet 2>/dev/null; then
    echo 'Puppet is Installed, updating...'
    yum -y update puppet 1>/dev/null 2>/dev/null
else
    echo 'Installing Puppet...'
    yum -y install puppet 1>/dev/null 2>/dev/null
fi