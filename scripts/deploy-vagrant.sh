#!/bin/bash
set -eox pipefail #safety for script


echo "=============================Install Vagrant============================================================="
export VAGRANT_CURRENT_VERSION="$(curl -s https://checkpoint-api.hashicorp.com/v1/check/vagrant | jq -r -M '.current_version')"
apt-get -qq update
apt-get install -qqy unzip jq
wget -nv https://releases.hashicorp.com/vagrant/${VAGRANT_CURRENT_VERSION}/vagrant_${VAGRANT_CURRENT_VERSION}_x86_64.deb
dpkg -i vagrant_${VAGRANT_CURRENT_VERSION}_x86_64.deb
vagrant version

# vagrant cloud auth login --token $VAGRANT_CLOUD_TOKEN #Securely authenticate with Vagrant Cloud using a token
# vagrant cloud auth login --username vagrantfoam --token $VAGRANT_CLOUD_TOKEN
# vagrant cloud auth whoami
# vagrant cloud auth login --check #Check if the current user is authenticated
# vagrant cloud auth logout

#Validate a token
curl \
		 --header "Authorization: Bearer $VAGRANT_TEST_TOKEN" \
  	 https://app.vagrantup.com/api/v1/authenticate

# vagrant cloud auth login --username --debug "$VAGRANT_USERNAME" --token $VAGRANT_TEST_TOKEN
# vagrant cloud auth whoami
# vagrant cloud auth logout
# echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# cd archlinux &&sudo packer build -debug -only=qemu -var-file=local.json vagrant.json

# cd vyos && packer build -var-file=vars.json vyos.json
# cd vyos && packer build -debug -var-file=vars.json vyos.json
# cd vyos && packer build -debug vyos.json
