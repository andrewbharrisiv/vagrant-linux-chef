#!/usr/bin/env bash
#
# Install Ruby Version Manager

# Check for Ruby Version Manager
if hash rvm 2>/dev/null; then
    echo 'Ruby Version Manager already installed, updating'
    rvm get $1 1>/dev/null
else
    echo 'Installing Ruby Version Manager...'
    curl -sSL https://get.rvm.io | bash -s $1 1>/dev/null 2>/dev/null
fi