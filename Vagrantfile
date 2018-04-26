Vagrant.configure("2") do |config|

    # manager ssh password: tcuser

    config.vm.synced_folder ".", "/vagrant"

    config.vm.define "linux-manager1", primary: true do |cfg|
      cfg.vm.box      = "31z4/boot2docker"
      cfg.vm.hostname = "linux-manager1"
      cfg.vm.network  "private_network", ip: "192.168.50.100"
  
      cfg.vm.provision "shell", path: "scripts/linux/wait-for-docker.sh"
      cfg.vm.provision "shell", path: "scripts/linux/manager.sh" do |s|
        s.args = ["192.168.50.100"]
      end
    end
  
    config.vm.define "linux-worker1" do |cfg|
      cfg.vm.box      = "31z4/boot2docker"
      cfg.vm.hostname = "linux-worker1"
      cfg.vm.network  "private_network", ip: "192.168.50.101"
  
      cfg.vm.provision "shell", path: "scripts/linux/wait-for-docker.sh"
      cfg.vm.provision "shell", path: "scripts/linux/worker.sh" do |s|
        s.args = ["192.168.50.101", "192.168.50.100:2377"]
      end
    end
  
    config.vm.define "windows-worker1" do |cfg|
      cfg.vm.box      = "StefanScherer/windows_2016_docker"
      cfg.vm.hostname = "windows-worker1"
      cfg.vm.network  "private_network", ip: "192.168.50.102"

      cfg.vm.provision "shell", path: "scripts/windows/worker.ps1", args: "-machineIp 192.168.50.102 -managerIp 192.168.50.100:2377"
    end

    config.vm.provider "virtualbox" do |v, override|
      v.gui = false
      v.memory = 2048
      v.cpus = 2
      v.linked_clone = true
    end
  end
  