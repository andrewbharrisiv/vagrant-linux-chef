#!/usr/bin/env bash
#
# Prepares the os vagrant environment for work

# setup additional package sources for yum
echo 'Installing ELRepo sources...'
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org 1>/dev/null
rpm -Uvh http://www.elrepo.org/elrepo-release-6-6.el6.elrepo.noarch.rpm >/dev/nul

echo 'Installing EPEL sources...'
rpm --import https://fedoraproject.org/static/0608B895.txt 1>/dev/null
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm 1>/dev/null

echo 'Installing IUS sources...'
rpm --import http://dl.iuscommunity.org/pub/ius/IUS-COMMUNITY-GPG-KEY 1>/dev/null
rpm -Uvh http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-11.ius.centos6.noarch.rpm 1>/dev/null

echo 'Installing Puppet Labs sources...'
rpm --import https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs 1>/dev/null
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm 1>/dev/null

echo 'Adding CentOS Linux Software Collections...'
yum -y install centos-release-SCL 1>/dev/null 2>/dev/null

echo 'Updating OS package sources...'
yum -y update 1>/dev/null

echo 'Copying dotfiles...'
cp -f /vagrant/vagrant/files/dotfiles/.bash_profile /home/vagrant/.bash_profile