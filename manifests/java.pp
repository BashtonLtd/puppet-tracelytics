class tracelytics::java {

  include tracelytics

  package { $::tracelytics::java_agent_package:
    ensure  => installed,
    require => Package[$::tracelytics::liboboe_package],
  }

  package { $::tracelytics::java_agent_native_package:
    ensure  => installed,
    require => Package[$::tracelytics::liboboe_package],
  }

}
