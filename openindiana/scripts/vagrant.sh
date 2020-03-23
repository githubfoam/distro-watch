#!/bin/bash -eux

if [[ ${PACKER_BUILDER_TYPE} =~ virtualbox ]]; then

echo '==> Configuring settings for vagrant'

    VAGRANT_USER=${VAGRANT_USER:-vagrant}
    VAGRANT_HOME=${VAGRANT_HOME:-/export/home/${VAGRANT_USER}}
    VAGRANT_INSECURE_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"

    # Add vagrant user (if it doesn't already exist)
    if ! id -u ${VAGRANT_USER} >/dev/null 2>&1; then
        echo "==> Creating ${VAGRANT_USER}"
        /usr/sbin/groupadd ${VAGRANT_USER}
        /usr/sbin/useradd -s /usr/bin/bash -m -d ${VAGRANT_HOME} -g ${VAGRANT_USER} ${VAGRANT_USER}
	/usr/bin/passwd -N vagrant

        echo "==> Giving ${VAGRANT_USER} sudo powers"
        echo "${VAGRANT_USER}        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
        echo 'Defaults env_keep += "SSH_AUTH_SOCK"' >> /etc/sudoers

        echo "==> Giving ${VAGRANT_USER} pfexec powers"
        /usr/sbin/usermod -P 'Primary Administrator' ${VAGRANT_USER}
    fi

    echo '==> Installing Vagrant SSH key'
    mkdir -pm 700 ${VAGRANT_HOME}/.ssh
    # https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
    echo "${VAGRANT_INSECURE_KEY}" > $VAGRANT_HOME/.ssh/authorized_keys
    chmod 0600 ${VAGRANT_HOME}/.ssh/authorized_keys
    chown -R ${VAGRANT_USER}:${VAGRANT_USER} ${VAGRANT_HOME}/.ssh

    echo '==> Recording box config date'
    date > /etc/vagrant_box_build_time
else
    echo '==> Skipping vagrant configuration for this platform'
fi
