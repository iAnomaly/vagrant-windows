# -*- mode: ruby -*-
# vi: set ft=ruby :

USERNAME = 'IEUser'
PASSWORD = 'Passw0rd!'

Vagrant.configure('2') do |config|
  config.vm.box = 'msedge-win10'
  # config.vm.box_url = 'https://az792536.vo.msecnd.net/vms/VMBuild_20171019/Vagrant/MSEdge/MSEdge.Win10.Vagrant.zip'
  config.vm.communicator = :winrm
  config.vm.guest = :windows
  config.winrm.username = USERNAME
  config.winrm.password = PASSWORD

  config.vm.provider 'virtualbox' do |vb|
    vb.gui = true
    vb.linked_clone = true if Gem::Version.new(Vagrant::VERSION) >= Gem::Version.new('1.8.0')

    vb.memory = 2048
    vb.cpus = 2
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    vb.customize ['modifyvm', :id, '--vram', '27']

    vb.customize 'post-boot', ['guestproperty', 'wait', :id, '/VirtualBox/GuestInfo/OS/LoggedInUsers', '--timeout', '60000']
    vb.customize 'post-boot', ['guestproperty', 'wait', :id, '/VirtualBox/GuestInfo/OS/LoggedInUsers', '--timeout', '60000']
    vb.customize 'post-boot', ['guestcontrol', :id, '--username', USERNAME, '--password', PASSWORD, 'run', '--', 'WindowsPowerShell\\v1.0\\powershell.exe', 'Start-Process -Verb RunAs -WindowStyle Hidden -- PowerShell "&{Set-NetConnectionProfile -NetworkCategory Private; winrm quickconfig -q;}"']
  end

  config.vm.provision 'chef_zero' do |chef|
    chef.nodes_path = 'nodes'
    chef.add_recipe 'vagrant'
  end

end
