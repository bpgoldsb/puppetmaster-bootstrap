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
    manifest      => '/srv/puppet/env/$environment/site.pp',
}
class { 'r10k': 
  r10k_basedir => '/srv/puppet/env',
}

class { 'hiera':
  datadir => '/srv/puppet/',
  manage_datadir => false,
  hierarchy => [
    "env/%{::environment}/hiera/%{::clientcert}",
    "env/%{::environment}/hiera_env/%{::clientcert}",
    "hiera/%{::clientcert}",
    "env/%{::environment}/hiera/%{::domain}",
    "env/%{::environment}/hiera_env/%{::domain}",
    "hiera/%{::domain}",
    "env/%{::environment}/hiera/common",
    "env/%{::environment}/hiera_env/common",
    "hiera/common",
  ],
}

file { '/srv/puppet': ensure => directory }
file { '/srv/puppet/env': ensure => directory }

