#!/bin/sh

hostname "graphite"
yum update -y
yum install -y epel-release
yum install -y ansible-2.3.0.0 unzip
yum install -y vim
yum install -y telnet
yum install -y nmap
yum install -y htop

#sudo yum install -y curl openssh-server
#sudo systemctl enable sshd
#sudo systemctl start sshd
#sudo yum install -y postfix
#sudo systemctl enable postfix
#sudo systemctl start postfix
sudo yum install java-1.8.0-openjdk


TMP_DIR=$(mktemp -d)
cd $TMP_DIR
wget "https://github.com/faisalnizam/ekdnata/archive/master.zip" 
unzip master.zip 
cd ekdnata-master/aws-solution/ansible
ansible-playbook -b -l localhost -i inventory/local.${env} playbooks/${playbook_name}.yml --connection=local
rm -rf $TMP_DIR
