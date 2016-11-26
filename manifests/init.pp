define linux_aliases
(
  $key = $title,
  $value
)
{
  file_line { "/etc/aliases_$key":
    ensure => present,
    path => '/etc/aliases',
    match => "^$key:.*$",
    line => "$key: $value"
  }

  exec { newaliases:
    path        => ["/usr/bin", "/usr/sbin"],
    subscribe   => File_line["/etc/aliases_$key"],
    refreshonly => true
  }
}



