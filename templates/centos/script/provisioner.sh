#!/bin/bash -eux

echo "==> Installing Puppet provisioner"
REDHAT_MAJOR_VERSION=$(egrep -Eo 'release ([0-9][0-9.]*)' /etc/redhat-release | cut -f2 -d' ' | cut -f1 -d.)

echo "==> Installing Puppet Labs repositories"
rpm -ipv "http://yum.puppetlabs.com/puppetlabs-release-el-${REDHAT_MAJOR_VERSION}.noarch.rpm"

echo "==> Installing Puppet version ${PUPPET_VERSION}"
yum -y install "puppet-${PUPPET_VERSION}"
