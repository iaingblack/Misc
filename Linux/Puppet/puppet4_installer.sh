wget https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install puppetlabs-release-pc1-el-7.noarch.rpm

tee /etc/yum.repos.d/puppetlabs-pc1.repo <<-'EOF'
[puppetlabs-pc1]
name=Puppet Labs PC1 Repository el 7 - $basearch
baseurl=http://yum.puppetlabs.com/el/7/PC1/$basearch
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs-PC1
file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet-PC1
enabled=1
gpgcheck=1
  
puppetlabs-pc1-source]
name=Puppet Labs PC1 Repository el 7 - Source
baseurl=http://yum.puppetlabs.com/el/7/PC1/SRPMS
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs-PC1
file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet-PC1
failovermethod=priority
enabled=0
gpgcheck=1
EOF
	
yum install puppet-agent

tee /etc/puppetlabs/puppet/puppet.conf  <<-'EOF'
[agent]
server=myserver.example.com
EOF

puppet agent --test