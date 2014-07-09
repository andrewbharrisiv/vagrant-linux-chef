#!/usr/bin/env bash
#
# Ensure chef client is installed on box

# download and execute chef install script which installs
# or updates chef client on box
echo 'Ensuring Chef is installed and up to date...'
curl -sSL https://www.opscode.com/chef/install.sh | bash 1>/dev/null 2>/dev/null
