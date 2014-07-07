class tomcat7 {

  package { 'wget':
    ensure => installed,
  }

  exec { 'apt-get update':
    command => 'apt-get update',
    path => ['/usr/bin'],
  }

  package { 'openjdk-7-jdk':
    ensure => installed,
    require => Exec['apt-get update'],
  }

  package { 'tomcat7':
    ensure => installed,
    require => Package['openjdk-7-jdk'],
  }

  service { 'tomcat7':
    require => Package['tomcat7'],
  }
}
