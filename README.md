Packer Templates
================

My opinionated Vagrant VirtualBox packer templates. Heavily based on the
[misheska/basebox-packer](https://github.com/misheska/basebox-packer)
templates.

## Installed Software

* Ubuntu Server **standard** selection
* Ruby 2.1.1 -- `/opt/ruby`
* Rubygems 2.2.2 -- `/opt/ruby/bin/gem`
* Puppet 3.5.1 -- `/opt/ruby/bin/puppet`
* VirtualBox guest additions 4.3.10

## Vagrant Provisioners

The boxes only support the [Vagrant Puppet](http://docs.vagrantup.com/v2/provisioning/puppet_apply.html)
provider for now.
