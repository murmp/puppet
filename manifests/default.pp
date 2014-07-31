exec { "apt-get update":
    path => "/usr/bin",
}
package { "apache2":
    ensure  => present,
    require => Exec["apt-get update"],
}
service { "apache2":
    ensure  => "running",
    require => Package["apache2"],
}
package { 'wget':
}

package { 'curl':
}

package { 'htop':
}

package { 'vim':
}

package { 'tree':
}

package { 'unzip':
}

file { '/sbin/update_puppet.sh':
    ensure  => present,
    content => 'cd /etc/puppet && git pull origin master && puppet apply /etc/puppet/manifests/default.pp',
    owner   => root,
    mode    => 744,
}
