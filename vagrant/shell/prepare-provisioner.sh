#!/usr/bin/env bash
#
# Prepare box for provisioning with chef solo

# Add rvm shell integration
source /usr/local/rvm/scripts/rvm

# copy chef file to temp folder
cp /vagrant/vagrant/chef/Cheffile /tmp/vagrant-chef-resources/Cheffile

# change directory to temp folder
pushd /tmp/vagrant-chef-resources

# Check for librarian-chef
if hash librarian-chef 2>/dev/null; then
    # update chef dependent cookbooks
    echo 'Running librarian-chef update'
    librarian-chef update
else
    echo 'Installing librarian-chef...'
    gem install librarian-chef --no-rdoc --no-ri

    # install chef dependent cookbooks
    echo 'Running librarian-chef install'
    librarian-chef install --clean
fi

# return to previous directory
popd