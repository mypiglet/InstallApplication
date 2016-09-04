#!/usr/bin/env bash
# Try block
{
    echo Update package information, ensure that APT works with the https method, and that CA certificates are installed
    apt-get update -y
    apt-get install -y apt-transport-https ca-certificates

    echo Add the new GPG key.
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

    echo Get current OS version
    current_ver=$(lsb_release -r | awk -F' ' '{ print $2} ')

    if [ "$current_ver" == "16.04" ]; then
        echo deb https://apt.dockerproject.org/repo ubuntu-xenial main > /etc/apt/sources.list.d/docker.list

    elif [ "$current_ver" == "15.10" ]; then

        echo https://apt.dockerproject.org/repo ubuntu-wily main > /etc/apt/sources.list.d/docker.list
    elif [ "$current_ver" == "14.04" ]; then

        echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list
    elif [ "$current_ver" == "12.04" ]; then

        echo deb https://apt.dockerproject.org/repo ubuntu-precise main > /etc/apt/sources.list.d/docker.list
    else
        echo Your OS version can not detech, Please check again.
        exit 1;
    fi

    echo Update the APT package index.
    apt-get update

    echo Purge the old repo if it exists.
    apt-get purge lxc-docker

    echo Verify that APT is pulling from the right repository.
    #apt-cache policy docker-engine

    echo Prerequisites by Ubuntu Version
    echo Install the recommended packages.
    app_name=""

    if [ "`dpkg -s linux-image-extra-$(uname -r) | grep Status: | awk -F': ' '{ print $2}'`" == "install ok installed" ]; then

        app_name="linux-image-extra-$(uname -r)"
    fi

    if [ "`dpkg -s linux-image-extra-virtual | grep Status: | awk -F': ' '{ print $2 }'`" == "install ok installed" ]; then

        app_name="$app_name linux-image-extra-virtual"
    fi
    #apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

    echo app name $app_name
    if [ "$app_name" != "" ]; then
        apt-get install -y $app_name
    fi

    #echo Upgrade your kernel and install the additional packages, do the following:
    echo Installing \"Linux-image-generic-lts-trusty\"
    if [ "$current_ver" == "12.04" ]; then
        apt-get install linux-image-generic-lts-trusty
    else
        echo SKIP because your Ubuntu OS version is not equal 12.04
    fi

# Catch block
} || {

    echo Execute some commands were failed.
    exit 1;
}