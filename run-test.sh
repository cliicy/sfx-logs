#!/bin/bash

source ./lib/automator
source cfg/sfx-config

timestamp=`date +%Y%m%d_%H%M%S`
log_dir=${bundle_dir}/${timestamp}

install_drv() {
    if [ "${SW_VERSION}" != "don't install" ];
    then
        init_network_env
        get_sw_dir ${SW_VERSION}
        get_install_pkg
        install_sw
    else
        export sw_ver=`sudo sfx-status | grep "Software Revision" | sed -r "s/\s+/,/g" | cut -d, -f3`
    fi
}

install_drv
if [ ! -d ${log_dir} ]; then
    mkdir -p ${log_dir}
fi
sudo /usr/bin/sfx-logs > ${log_dir}/sfx-logs.out  2>&1
mv *_bundle.tar.gz ${log_dir} 
