#!/bin/sh

docker run  --privileged -v "$HOME/github/OSX-KVM:/home/osx-kvm" --name qemu-`hostname` -it -e USER_ID=`id -u`  -e GROUP_ID=`id -g` gewu4zhizhi/osx-kvm:ubuntu18.04 
