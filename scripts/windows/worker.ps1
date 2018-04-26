param ([String] $machineIp, [String] $managerIp)

Write-Host "Restarting Docker"
Restart-Service docker

Write-Host "Opening Docker TLS port"
& netsh advfirewall firewall add rule name="Docker TLS" dir=in action=allow protocol=TCP localport=2376

Write-Host "Opening Docker swarm-mode cluster management TCP port"
& netsh advfirewall firewall add rule name="Docker swarm-mode cluster management TCP" dir=in action=allow protocol=TCP localport=2377

Write-Host "Opening Docker swarm-mode node communication UDP port"
& netsh advfirewall firewall add rule name="Docker swarm-mode node communication TCP" dir=in action=allow protocol=TCP localport=7946

Write-Host "Opening Docker swarm-mode node communication UDP port"
& netsh advfirewall firewall add rule name="Docker swarm-mode node communication TCP" dir=in action=allow protocol=UDP localport=7946

Write-Host "Opening Docker swarm-mode overlay network UDP port"
& netsh advfirewall firewall add rule name="Docker swarm-mode overlay network UDP" dir=in action=allow protocol=UDP localport=4789

cd /vagrant
docker swarm join --advertise-addr $machineIp --listen-addr $machineIp --token (cat .join-token-worker) $managerIp