#!/bin/sh

# --------------------------
# Install Base Applications
# --------------------------

hostname "jenkins-${index_value}"
yum update -y
yum install -y epel-release
yum install -y ansible-2.3.0.0 unzip
yum install -y vim
yum install -y wget
yum install -y telnet
yum install -y nmap

# -------------------------------
# Install Necessary Applications
# -------------------------------

yum install -y python-pip
pip install awscli
sudo yum install -y curl openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd


# ----------------------
# Ansible Part
# ----------------------

TMP_DIR=$(mktemp -d)
cd $TMP_DIR
wget "https://github.com/faisalnizam/ekdnata/archive/master.zip"
unzip jenkins.zip
cd ekdnata-*
ansible-playbook -b -l localhost -i inventory/local.${env} playbooks/${playbook_name}.yml --connection=local
