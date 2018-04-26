# Multi-OS Docker Swarm Vagrant Environment

Used [31z4/vagrant-boot2docker-swarm](https://github.com/31z4/vagrant-boot2docker-swarm) as a starter point for creating a Multi-Host and Multi-OS swarm in a single vagrant file.

Run the following commang and wait a few minutes..

```console
$ vagrant up
```

The swarm has a single manager and two worker nodes:

```console
$ vagrant ssh
Current machine states:

linux-manager1            running (virtualbox)
linux-worker1             running (virtualbox)
windows-worker1           running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
````

You can then SSH into the manager. The SSH password is: _tcuser_

```console
$ vagrant ssh
==> linux-manager1: The machine you're attempting to SSH into is configured to use
==> linux-manager1: password-based authentication. Vagrant can't script entering the
==> linux-manager1: password for you. If you're prompted for a password, please enter
==> linux-manager1: the same password you have configured in the Vagrantfile.
docker@127.0.0.1's password: 
                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o           __/
             \    \         __/
              \____\_______/
 _                 _   ____     _            _
| |__   ___   ___ | |_|___ \ __| | ___   ___| | _____ _ __
| '_ \ / _ \ / _ \| __| __) / _` |/ _ \ / __| |/ / _ \ '__|
| |_) | (_) | (_) | |_ / __/ (_| | (_) | (__|   <  __/ |
|_.__/ \___/ \___/ \__|_____\__,_|\___/ \___|_|\_\___|_|
Boot2Docker version 18.01.0-ce, build HEAD : 0bb7bbd - Thu Jan 11 16:32:39 UTC 2018
Docker version 18.01.0-ce, build 03596f5
docker@linux-manager1:~$ 
```

You can check the nodes to confirm that the cluster is up

```console
docker@linux-manager1:~$ docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
c0fjbpdvfnq15tqt6kdfi9b1g *   linux-manager1      Ready               Active              Leader
kzp2lxkujglufinr4wvggjth6     linux-worker1       Ready               Active              
mt7a1fkyyfs7k7sdjbl4lz4ww     windows-worker1     Ready               Active              
docker@linux-manager1:~$ 
```
