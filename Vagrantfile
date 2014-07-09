# -*- mode: ruby -*-
# vi: set ft=ruby :

# set project specific variables
PROJECT_NAME = 'linux'

# set default vagrant provider
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|  
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = 'chef/centos-6.5'

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = ''

  # Configure guest network settings
  config.vm.network :forwarded_port, guest: 80, host: 50001

  # Synced Folders
  config.vm.synced_folder 'app', '/var/www/website'
  config.vm.synced_folder 'vagrant/chef/box_cookbooks', '/tmp/vagrant-chef-resources/cookbooks'
  config.vm.synced_folder 'vagrant/chef/tmp', '/tmp/vagrant-chef-resources/tmp'
  
  # Virual Box provider configuration
  config.vm.provider :virtualbox do |v, override|
    v.name = "vagrant_#{PROJECT_NAME}"
    v.gui = false
    v.memory = '512'
    v.cpus = '1'
  end

  # VMWare Fusion provider configuration
  config.vm.provider :vmware_fusion do |v, override|
    v.name = "vagrant_#{PROJECT_NAME}"
    v.gui = false
    v.vmx['memsize'] = '512'
    v.vmx['numvcpus'] = 1
  end

  # Shell provisioner
  config.vm.provision :shell, :path => 'vagrant/shell/prepare-os.sh'
  config.vm.provision :shell, :path => 'vagrant/shell/install-git.sh'
  config.vm.provision :shell, :path => 'vagrant/shell/install-rvm.sh', :args => 'stable'
  config.vm.provision :shell, :path => 'vagrant/shell/install-ruby.sh', :args => '1.9.3'
  config.vm.provision :shell, :path => 'vagrant/shell/install-chef.sh'
  config.vm.provision :shell, :path => 'vagrant/shell/prepare-provisioner.sh'

  # Chef provisioner
  config.vm.provision :chef_solo do |chef|
    # chef options
    node_name = 'vagrant-linux'

    # chef solo only options
    chef.cookbooks_path = ['vagrant/chef/box_cookbooks', 'vagrant/chef/cookbooks']

    # provisioning config
    chef.add_recipe 'vagrant_main'
  end
  
  # Configure ssh settings
  # config.ssh.keep_alive = true
end

