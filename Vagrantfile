# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  config.vm.box = "debian/contrib-jessie64"
  config.vm.provision "shell", inline: "run-parts /vagrant/Vagrant/privileged"

  ["v0.12.0", "v0.16.0", "v0.17.0"].each do |treeish|
    config.vm.define treeish do |node|
      node.vm.provision "shell",
        env: {"TREEISH" => treeish},
        # Use 'su' instead of running as a non-privileged user so that changes
        # to the user's new groups are picked up.
        inline: "su --command 'run-parts /vagrant/Vagrant' vagrant"
    end
  end
end
