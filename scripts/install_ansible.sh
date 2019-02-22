#!/bin/bash

##
# install_ansible.sh
# written by Diego Gutierrez <diego.gutierrez@wexinc.com>
# This will run yum update and will install ansible and all needed
# dependencies
##

# pip_command: the base command for pip
pip_command="pip --disable-pip-version-check"

# install dependencies
yum -y update
yum -y install gcc libffi-devel openssl-devel python-pip
${pip_command} install -U setuptools

# install ansible
${pip_command} install ansible==2.4.0

# install boto3
${pip_command} install boto3 boto

## set up ansible ##
# create ansible and roles directory
mkdir -p /etc/ansible/roles

# create facts directory
mkdir -p /etc/ansible/facts.d

# create ansible hosts file
touch /etc/ansible/hosts

echo "localhost ansible_connection=local" > /etc/ansible/hosts