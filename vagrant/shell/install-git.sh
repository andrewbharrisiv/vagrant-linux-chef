#!/usr/bin/env bash
#
# Ensure git version control is installed

# Check if git is installed
if ! hash git 2>/dev/null; then
    echo 'Installing git version control...'
    yum -y install git 1>/dev/null 2>/dev/null
fi