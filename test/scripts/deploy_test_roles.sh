#!/bin/bash

##
# deploy_test_roles.sh
# Arg1: the s3 url of the ansible roles to pull
# Arg2: the s3 region
# written by Diego Gutierrez <diego.gutierrez@wexinc.com>
# this will pull test roles from s3 and deploy them on the
# server for testing
##

## CLI ARGS ##
s3Url=$1
s3Region=$2


rm -f /root/ansible_roles.zip

aws s3 cp ${s3Url} /root/ansible_roles.zip --region ${s3Region}

unzip /root/ansible_roles.zip -d /etc/ansible/roles
