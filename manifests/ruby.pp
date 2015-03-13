class tracelytics::ruby {

  include tracelytics

  package { $::tracelytics::ruby_oboe_package:
    ensure   => installed,
    provider => gem,
    source   => 'http://gem.tracelytics.com/',
    require  => [ Package['rubygems'], Package[$::tracelytics::liboboe_dev_package]],
  }

  package { $tracelytics::params::ruby_oboe_fu_package:
    ensure   => installed,
    provider => gem,
    source   => 'http://gem.tracelytics.com/',
    require  => [ Package['rubygems'], Package[$::tracelytics::liboboe_dev_package]],
  }

}
