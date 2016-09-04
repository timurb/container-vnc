# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
#  config.vm.box = "ubuntu/xenial64" # TurboVNC doesn't work in Xenial due to systemd
  config.vm.box = 'ubuntu/trusty64'

  config.vm.provision :shell, path: 'scripts/install-vnc.sh'
  config.vm.provision :shell, path: 'scripts/vnc-user.sh', args: 'vagrant'
# Default password is 'password', change password like the following
#  config.vm.provision :shell, path: 'scripts/vnc-user.sh', args: 'vagrant PASSWORD'

  config.vm.provision :shell, inline: '/etc/init.d/tvncserver start'



  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network 'private_network', ip: '192.168.33.10'

  # To speedup installation of packages on slow networks
  # run `vagrant plugin install vagrant-cachier` once
  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box

    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
  end
  config.ssh.forward_agent = true
end
