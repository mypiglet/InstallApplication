#!/usr/bin/env bash

echo "Installing MongoDB (Step 1 Import the public key used by the package management system)"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

echo "Install MongoDB (Step 2 Create a list file for MongoDB)"
current_ver=$(lsb_release -r | awk -F' ' '{ print $2} ')

if [ "$current_ver" == "16.04" ]
then

    echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
elif [ "$current_ver" == "14.04" ]
then

    echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
fi

#apt-get update
#apt-get install -y mongodb-org

#Copy file mongod.service to /lib/systemd/system/mongod.service
#cp -f /install/roles/ubuntu/files/mongod.service /lib/systemd/system/mongod.service

