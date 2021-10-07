# Increase requests limit

exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/bin/:/usr/local/bin/',
}

exec { 'restart nginx':
  command => 'service nginx restart',
  path    => '/bin/:/usr/bin/:/usr/sbin/',
}
