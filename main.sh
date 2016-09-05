#!/usr/bin/env bash
##!bin/bash
#sudo apt-get install software-properties-common -y
#sudo apt-add-repository ppa:ansible/ansible
#sudo apt-get update -y
#sudo apt-get install ansible -y

# Install Pip


if [ "`dpkg -s pip | grep Status: | awk -F': ' '{ print $2}'`" != "install ok installed" ]; then
    apt-get -y install python-pip
fi


#Run ansible playbook
ansible-playbook -i inventory/local/ubuntu-local.yml install/install-all.yml --tags jenkins


