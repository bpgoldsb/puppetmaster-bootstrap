$certname = 'bebr-srv-puppet-01.bebr.ufl.edu'

if $certname != '' {
  validate_re($certname, '^[a-zA-Z0-9\-\.)]+$', '$certname must only contain letters, numbers, periods, hypens (-) and underscores (_)' )
} else { 
  fail('You must set $certname')
}

class { 'epel': }
class { 'puppetdb': }
class { 'puppet::master':
    storeconfigs  => true,
    require       => Class['::epel'],
    modulepath    => '/srv/puppet/env/$environment/modules',
    manifest      => '/etc/puppet/env/$environment/site.pp',
}
class { 'r10k': }

file { '/srv/puppet': ensure => directory }
file { '/srv/puppet/env': ensure => directory }

