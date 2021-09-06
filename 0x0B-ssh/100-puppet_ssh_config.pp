#Setting up the client SSH configuration file

file { 'ssh_config is present':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
}

file { 'holberton is present':
  ensure => 'present',
  path   => '~/.ssh/holberton',
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
