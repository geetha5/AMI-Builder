#!/bin/bash

##
# run_cis_cat.sh
# written by Diego Gutierrez <diego.gutierrez@wexinc.com>
# This will run the cis benchmarking tool
##

mkdir /root/cis_results
mkdir /home/ec2-user/cis_results
rm -rf /root/cis_results/*
rm -rf /home/ec2-user/cis_results/*

pushd /root/cis-cat-full

    chmod 700 CIS-CAT.sh

    sudo ./CIS-CAT.sh -b benchmarks/CIS_Amazon_Linux_Benchmark_v2.0.0-xccdf.xml \
    -a -r /root/cis_results

    cp /root/cis_results/* /home/ec2-user/cis_results/
    chmod 777 -R /home/ec2-user/cis_results

popd