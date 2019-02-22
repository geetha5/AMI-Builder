#!/bin/bash

##
# deploy_cis_cat.sh
# Arg1: The s3 url of the cis cat zip
# Arg2: The s3 region of the cis cat zip
# Written by Diego Gutierrez <diego.gutierrez@wexinc.com>
# This will pull and deploy the cis benchmarking tool from s3
##

## CLI ARGS ##
s3Url=$1
s3Region=$2

rm -f /root/cis_benchmark.zip

aws s3 cp ${s3Url} /root/cis_benchmark.zip --region ${s3Region}

unzip /root/cis_benchmark.zip -d /root