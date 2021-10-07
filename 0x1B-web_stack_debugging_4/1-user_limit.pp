# Change OS configuration so that it is possible to login
# with the holberton user and open a file without any error message

exec { 'holberton-hard':
  command => 'sed -i "/holberton hard nofile/s/5/97816/" /etc/security/limits.conf',
  path    => '/bin/:/sbin/:/usr/bin/:/usr/sbin/:/usr/local/bin/',
}

exec { 'holberton-soft':
  command => 'sed -i "/holberton soft nofile/s/5/97816/" /etc/security/limits.conf',
  path    => '/bin/:/sbin/:/usr/bin/:/usr/sbin/:/usr/local/bin/',
}
