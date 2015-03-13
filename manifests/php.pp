class tracelytics::php {

  include tracelytics

  package { $::tracelytics::php_oboe_package:
    ensure  => installed,
    require => Package[$::tracelytics::liboboe_package],
  }

}
