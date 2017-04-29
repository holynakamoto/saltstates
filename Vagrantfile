Vagrant.configure("2") do |config|
  ## Choose your base box
  config.vm.box = "bento/centos-6.7"

  ## For masterless, mount your salt file root
  config.vm.synced_folder ".", "/srv/saltstates/"

  ## Use all the defaults:
  config.vm.provision :salt do |salt|
    salt.bootstrap_script = './vagrant-salt/bootstrap-salt.sh'
    salt.verbose = true
    salt.minion_config = './vagrant-salt/minion_config'
    salt.run_highstate = true
    salt.colorize = true
  end
end
