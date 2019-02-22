#!/bin/bash -x

##
# cleanup_cis_ansible.sh
# written by Diego Gutierrez <diego.gutierrez@wexinc.com>
# this will clean up the the cis role and playbook
##

rm -rf /etc/ansible/roles/*
rm -rf /etc/ansible/facts.d/*
rm -rf /etc/ansible/cis_playbook.yml