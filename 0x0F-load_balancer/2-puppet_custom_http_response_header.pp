# Add a custom HTTP header with Puppet
exec { 'update':
  command => '/usr/bin/apt-get update',
}

package { 'nginx':
  ensure  => 'installed',
  name    => 'nginx',
  require => Exec['apt-get-update'],
}

file_line { 'listen port 80 & add X-Served-By header':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => 'add_header X-Served-By $hostname;',
  require => Package['nginx'],
}

exec { 'add line':
  ensure  => 'present',
  user    => 'root',
  command => 'sudo echo "Holberton School for the win!" | sudo tee /var/www/html/index.nginx-debian.html',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
