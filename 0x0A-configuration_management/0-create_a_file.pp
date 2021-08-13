#Create a file in /tmp using puppet

  file { '/tmp/holberton':
    ensure  => 'present',
    group   => 'www-data',
    mode    => '0744',
    owner   => 'www-data',
    content => 'I love Puppet',
  }
