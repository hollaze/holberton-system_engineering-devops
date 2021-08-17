#Setting up the client SSH configuration file,
#to connect to a server without typing a password

file_line { 'Using private key':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '    IdentifyFile ~/.ssh/holberton',
}

file_line { 'Refuse authentificate password':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '    PasswordAuthentification no',
}
