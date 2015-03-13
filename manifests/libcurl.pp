class tracelytics::libcurl {

  include tracelytics

  package { $::tracelytics::libcurl_package:
    ensure  => $::tracelytics::libcurl_version,
    require => Package[$::tracelytics::liboboe_package],
  }

}
