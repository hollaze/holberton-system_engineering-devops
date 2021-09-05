# Add a custom HTTP header with Puppet

exec { 'update':
  command => '/usr/bin/apt-get update',
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['apt-get-update'],
}

exec { 'add X-Served-By':
  command => 'sed -i "/server_name _;/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default',
}

exec { 'restart nginx':
  command => 'service nginx restart',
}
