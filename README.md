puppet-bootstrap
================

Simple puppet code to bootstrap a puppet master (under passenger) with accessories (puppetdb, r10k, hiera) using modules from Forge.  Requires puppet to already be installed.  Tested on puppet 3.5.x

Usage
=====

Edit bootstrap.pp and change $certname to the certname you want for your puppetmaster

```
git clone https://github.com/bpgoldsb/puppet-bootstrap.git bootstrap_puppet
cd bootstrap_puppet
vim bootstrap.pp
puppet apply bootstrap.pp --modulepath modules
```
