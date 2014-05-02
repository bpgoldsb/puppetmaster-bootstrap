puppet-bootstrap
================

Simple module to bootstrap a puppet master (under passenger) and puppetdb using modules from Forge


Usage
=====

Edit bootstrap.pp and change $certname to the certname you want for your puppetmaster

```
git clone https://github.com/bpgoldsb/puppet-bootstrap.git bootstrap_puppet
cd bootstrap_puppet
vim bootstrap.pp
puppet apply bootstrap.pp --modulepath modules
```
