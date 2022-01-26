Vagrant.configure('2') do |config|

  config.vm.box = 'ubuntu/focal64'

  config.vm.hostname = 'docker.local'

  config.vm.network 'private_network', ip: '192.168.56.4'

  config.vm.network 'forwarded_port', guest: 2375, host: 2375, id: 'dockerd'

  config.vm.provider 'virtualbox' do |vb|

    vb.name = 'ubuntu-docker'

    vb.memory = '2048'

    vb.cpus = '2'

  end

  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/main_rsa.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
      echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
    SHELL
  end

  config.vm.provision 'shell', path: 'provision.sh'


  # Configuration for Port Forwarding

  # Uncomment or add new ones here as required

  # config.vm.network 'forwarded_port', guest: 6379, host: 6379, id: 'redis'

  # config.vm.network 'forwarded_port', guest: 3306, host: 3306, id: 'mysql'

end
