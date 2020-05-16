#
# Minimum Docker image to build Android AOSP
#
FROM ubuntu:18.04

MAINTAINER 格物致知 <gewu4zhizhi@outlook.com>

# Keep the dependency list as short as reasonable
RUN apt update && \
    apt install -y qemu uml-utilities virt-manager dmg2img git wget libguestfs-tools \
        bridge-utils dnsmasq iptables net-tools

ENV TERM xterm

