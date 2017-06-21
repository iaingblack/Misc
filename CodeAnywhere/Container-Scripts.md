# Scripts to create Containers
A general list of commands to recreate containers

## CentOS 6

### Chef / Serverspec / KitchenCI

To install a chef environment with Serverspec, KitchenCI etc... run these commands on a blank container

[Latest ChefDK Downloads](https://downloads.chef.io/chefdk)
[Docker-Machine](https://github.com/docker/machine/releases)

Install chefdk and bits and bobs, then install docker-machine
```
echo CHEFDK
sudo yum install -y https://packages.chef.io/files/stable/chefdk/1.4.3/el/6/chefdk-1.4.3-1.el6.x86_64.rpm
chef verify
echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile
source ~/.bash_profile
which ruby
which gem
sudo yum groupinstall "development tools" -y 
gem install kitchen-azurerm

echo DOCKER-MACHINE
curl -L https://github.com/docker/machine/releases/download/v0.12.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

sudo yum clean all
clear

#NONE OF THIS WORKS
#------------------
#echo DOCKER (for client tools)
#sudo yum install -y http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#sudo yum -y install docker-io
#sudo service docker start
#sudo chkconfig docker on

#sudo yum install -y yum-utils device-mapper-persistent-data lvm2
#sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#sudo yum install -y docker-ce
```

