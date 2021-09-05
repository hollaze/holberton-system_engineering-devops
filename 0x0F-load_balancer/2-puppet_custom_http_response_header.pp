exec { 'update':
  command => '/usr/bin/apt-get update',
  user    => 'root',
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['apt-get-update'],
}

file { 'index.html':
  ensure  => 'present',
  path    => '/var/www/html/index.html',
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  content => 'Holberton School for the win!',
}

exec { 'add X-Served-By':
  command => '"/server_name _;/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default',
  user    => 'root',
}

exec { 'restart nginx':
  command => 'service nginx restart',
  user    => 'root',
}
