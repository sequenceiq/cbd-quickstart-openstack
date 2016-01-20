#!/bin/bash

exec > >(tee "/tmp/${BASH_SOURCE}.log") 2>&1
set -x

install_cbd() {
    cd /home/centos/cloudbreak-deployment
    cbd init
    echo export PUBLIC_IP=$(curl ipecho.net/plain) > Profile
    cbd generate
    cbd start
}

main() {
    install_cbd
}

[[ "$0" == "$BASH_SOURCE" ]] && main "$@" || true
