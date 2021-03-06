#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "========================================================================================="
vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers

# https://app.vagrantup.com/generic/boxes/gentoo
vagrant box add "generic/gentoo" --provider=virtualbox
vagrant init --template Vagrantfile.provision.bash.generic.erb
vagrant up --provider=libvirt "vg-gentoo-02"

vagrant box list #veridy installed boxes
virsh list --all #show all running KVM/libvirt VMs



echo "========================================================================================="
