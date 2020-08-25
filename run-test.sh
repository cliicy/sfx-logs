#!/bin/bash

source ./lib/automator

if [ "${SW_VERSION}" != "don't install" ];
then
    init_network_env
    get_sw_dir ${SW_VERSION}
    get_install_pkg
    install_sw
else
    export sw_ver=`sudo sfx-status | grep "Software Revision" | sed -r "s/\s+/,/g" | cut -d, -f3`
fi

