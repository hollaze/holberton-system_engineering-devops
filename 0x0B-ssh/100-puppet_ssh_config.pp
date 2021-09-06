#Setting up the client SSH configuration file

file { 'File is present':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
}

file_line { 'PasswordAuthentication':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '    PasswordAuthentication no',
}

file_line { 'IdentifyFile':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '    IdentifyFile ~/.ssh/holberton',
}
