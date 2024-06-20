Vagrant.configure("2") do |config|
  # Configure Windows_Server VM
  config.vm.define "Windows_Server" do |win_server|
    win_server.vm.box = "gusztavvargadr/windows-server-2022-standard"
    win_server.vm.provider "virtualbox" do |vb|
      vb.name = "Windows Server"
      vb.memory = 4000
      vb.cpus = 2
      # Startet die Maschine im Hintergrund
      vb.gui = false
    end
    win_server.vm.synced_folder '.', '/vagrant', disabled: true
    host_shared_folder = ENV["HOME"] + "/Shared" #legt einen neuen Ordner an, Pfad kann nach Bedarf angepasst werden
    guest_shared_folder = "C:/Shared" # Pfad auf der VM
    win_server.vm.synced_folder host_shared_folder, guest_shared_folder, create:true

    win_server.vm.network "private_network", ip: "192.168.56.200", name: 'VirtualBox Host-Only Ethernet Adapter'
    win_server.vm.guest = :windows
    win_server.vm.communicator = "winrm"
    win_server.vm.provision :shell, :path => "./vagrant/Install-WMF3Hotfix.ps1", privileged: false
    win_server.vm.provision :shell, :path => "./vagrant/ConfigureRemotingForAnsible.ps1", privileged: false
    win_server.vm.provision :shell, :path => "./vagrant/set_keyboard_layout.ps1", privileged: false

  end

  # Configure Kali VM
  config.vm.define "Kali" do |kali|
    kali.vm.box = "kalilinux/rolling"
    kali.vm.provider "virtualbox" do |vb|
      vb.name = "Kali"
      vb.memory = 4000
      vb.cpus = 2
    end
    kali.vm.synced_folder '.', '/vagrant', disabled: true
    host_shared_folder = ENV["HOME"] + "/Shared" # legt einen neuen Ordner auf dem Host an, Pfad kann nach Bedarf angepasst werden
    guest_shared_folder = "/home/vagrant/Shared" # Pfad auf der VM
    kali.vm.synced_folder host_shared_folder, guest_shared_folder, create:true


    kali.vm.network "private_network", ip: "192.168.56.100", name: 'VirtualBox Host-Only Ethernet Adapter'
    kali.vm.communicator = "ssh"
    kali.vm.provision "shell", inline: <<~SHELL 
    # Modify /etc/default/keyboard to set keyboard layout to German   
    sudo sed -i 's/us/de/g' /etc/default/keyboard
    SHELL
    kali.vm.provision "shell", inline: "sudo reboot"
  end
end