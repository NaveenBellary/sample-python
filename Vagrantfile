Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "sample-python"

  #Configure Sync Folders
  config.vm.synced_folder ".", "/home/vagrant/app"

  #Configure VM Settings
  config.vm.provider :"virtualbox" do |vb|
     vb.name = "sample-python"
     vb.memory = "2048"
     vb.cpus = 2
  end

  #Provisioning via Shell
  config.vm.provision "shell", :path => "./tools/bootstrap_vagrant.sh"
end
