class tracelytics (
  $access_key,
  $apache_package            = $::tracelytics::params::apache_package,
  $apache_mod_oboe_package   = $::tracelytics::params::apache_mod_oboe_package,
  $apache_mod_oboe_config    = $::tracelytics::params::apache_mod_oboe_config,
  $java_agent_package        = $::tracelytics::params::java_agent_package,
  $java_agent_native_package = $::tracelytics::params::java_agent_native_package,
  $libcurl_package           = $::tracelytics::params::libcurl_package,
  $libcurl_version           = $::tracelytics::params::libcurl_version,
  $nginx_mod_oboe_config     = $::tracelytics::params::nginx_mod_oboe_config,
  $php_oboe_package          = $::tracelytics::params::php_oboe_package,
  $python_package            = $::tracelytics::params::python_package,
  $python_dev_package        = $::tracelytics::params::python_dev_package,
  $ruby_oboe_package         = $::tracelytics::params::ruby_oboe_package,
  $ruby_oboe_fu_package      = $::tracelytics::params::ruby_oboe_fu_package,
  $tracelyzer_service        = $::tracelytics::params::tracelyzer_service,
  $tracelyzer_package        = $::tracelytics::params::tracelyzer_package,
  $tracelyzer_config         = $::tracelytics::params::tracelyzer_config,
  $tracelytics_config        = $::tracelytics::params::tracelytics_config,
  $liboboe_package           = $::tracelytics::params::liboboe_package,
  $liboboe_dev_package       = $::tracelytics::params::liboboe_dev_package,
) inherits tracelytics::params {

  tracelytics::repo { 'tracelytics':
    access_key => $access_key,
  }

  package { $liboboe_package:
    ensure  => installed,
    require => Tracelytics::Repo['tracelytics'],
  }

  package { $liboboe_dev_package:
    ensure  => installed,
    require => Package[$liboboe_package],
  }

  file { $tracelytics_config:
    owner   => root,
    group   => root,
    mode    => 0666,
    replace => false,
    content => template('tracelytics/tracelytics.conf.erb'),
  }

  package { $tracelyzer_package:
    ensure  => installed,
    require => [
      Package[$liboboe_package],
      File[$tracelytics_config],
    ],
  }

  file { $tracelyzer_config:
    owner   => appneta,
    group   => root,
    mode    => 0644,
    require => Package[$tracelyzer_package],
    notify  => Service[$tracelyzer_service],
  }

  service { $tracelyzer_service:
    ensure  => running,
    enable  => true,
    require => File[$tracelyzer_config],
  }
}
