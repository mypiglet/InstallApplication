##!bin/bash
#sudo apt-get install software-properties-common -y
#sudo apt-add-repository ppa:ansible/ansible
#sudo apt-get update -y
#sudo apt-get install ansible -y

#Run ansible playbook
ansible-playbook -i inventory/local/ubuntu-local.yml install/install-all.yml --tags dev-tools


