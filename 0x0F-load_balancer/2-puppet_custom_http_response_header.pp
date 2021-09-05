# Add a custom HTTP header with Puppet

exec { 'update':
  command => '/usr/bin/apt-get update',
}

package { 'nginx':
  ensure  => 'installed',
  name    => 'nginx',
  require => Exec['apt-get-update'],
}

exec { 'add X-Served-By':
  command => '"/server_name _;/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default',
}

exec { 'listen port 80':
  command => 'Listen 80 default_server;',
}

exec { 'restart nginx':
  command => 'service nginx restart',
}
