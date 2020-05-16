#
# Makefile to build and test docker containers
#   VOL1 - the one used to build source code
#   VOL2 - the one used to store build cache
# Both can be defined in your environment, otherwise the below default values
# will be used.

DOCKER = docker
IMAGE = gewu4zhizhi/osx-kvm:ubuntu18.04
VOL1 ?= $(HOME)/osx-kvm
USER_ID := $(shell id -u)
GROUP_ID := $(shell id -g)

osx-kvm: Dockerfile
	$(DOCKER) build -t $(IMAGE) .

test:
	$(DOCKER) run --privileged -v "$(VOL1):/home/osx-kvm" -it -e USER_ID=$(USER_ID) -e GROUP_ID=$(GROUP_ID) $(IMAGE) /bin/bash

all: osx-kvm

.PHONY: all

clean:
	rm -rf *.dist 2>/dev/null
	rm -rf *.sucatalog 2>/dev/null
	rm -rf *.smd 2>/dev/null
