# Increase requests limit

exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" etc/default/nginx',
  path    => '/bin/:/sbin/:/usr/bin/:/usr/sbin/',
}

exec { 'restart nginx':
  command => 'service nginx restart',
  path    => '/etc/init.d/',
}
