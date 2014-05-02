$certname = ''

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
}

file { '/srv/puppet': ensure => directory }

puppet::masterenv {'dev':
    modulepath => '/srv/puppet/env/dev/modules',
    manifest   => '/etc/puppet/env/dev/site.pp',
}
puppet::masterenv {'production':
    modulepath => '/srv/puppet/env/production/modules',
    manifest   => '/srv/puppet/env/production/site.pp',
}

