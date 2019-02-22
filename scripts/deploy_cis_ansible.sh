#!/bin/bash -x

##
# deploy_cis_ansible.sh
# written by Diego Gutierrez <diego.gutierrez@wexinc.com>
# This will deploy the CIS role, ansible.cfg and cis playbook to
# the correct location on the machine
##

# deploy ansible.cfg
cp /tmp/ansible.cfg /etc/ansible/ansible.cfg
chown root:root /etc/ansible/ansible.cfg

# deploy cis_playbook.yml
cp /tmp/cis_playbook.yml /etc/ansible/cis_playbook.yml
chown root:root /etc/ansible/cis_playbook.yml

# deploy the role
cp -r /tmp/anthcourtney.cis-amazon-linux /etc/ansible/roles/anthcourtney.cis-amazon-linux
chown -R root:root /etc/ansible/roles

# deploy the custom fact
cp /tmp/anthcourtney.cis-amazon-linux/facts/* /etc/ansible/facts.d/
chown root:root /etc/ansible/facts.d/*
chmod 755 /etc/ansible/facts.d/*


