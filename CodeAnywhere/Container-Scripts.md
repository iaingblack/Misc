# Scripts to create Containers
A general list of commands to recreate containers

## CentOS 6

### Chef / Serverspec / KitchenCI

To install a chef environment with Serverspec, KitchenCI etc... run these commands on a blank container

[Latest ChefDK Downloads](https://downloads.chef.io/chefdk)

Install chefdk, verify, clean, set chef ruby as system ruby, reload bash profile, install serverspec
```
sudo yum install -y https://packages.chef.io/files/stable/chefdk/1.4.3/el/6/chefdk-1.4.3-1.el6.x86_64.rpm
chef verify
sudo yum clean all
echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile
source ~/.bash_profile
chef verify
```

