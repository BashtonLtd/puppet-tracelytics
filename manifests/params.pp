class tracelytics::params {

  if $::osfamily == 'RedHat' or $::operatingsystem == 'amazon' {
    $apache_package            = 'apache2'
    $apache_mod_oboe_package   = 'libapache2-mod-oboe'
    $apache_mod_oboe_config    = '/etc/httpd/conf.d/oboe.conf'
    $java_agent_package        = 'tracelytics-java-agent'
    $java_agent_native_package = 'tracelytics-java-agent-native'
    $libcurl_package           = 'libcurl'
    $libcurl_version           = 'installed'
    $nginx_mod_oboe_config     = '/etc/nginx/conf.d/oboe.conf'
    $php_oboe_package          = 'php-oboe'
    $python_package            = 'python'
    $python_dev_package        = 'python-devel'
    $ruby_oboe_package         = 'oboe'
    $ruby_oboe_fu_package      = 'oboe-fu'
    $tracelyzer_service        = 'tracelyzer'
    $tracelyzer_package        = 'tracelyzer'
    $tracelytics_config        = '/etc/tracelytics.conf'
    $liboboe_package           = 'liboboe'
    $liboboe_dev_package       = 'liboboe-devel'
  } elsif $::osfamily == 'Debian' {
    $apache_package            = 'httpd'
    $apache_mod_oboe_package   = 'libapache2-mod-oboe'
    $apache_mod_oboe_config    = '/etc/apache2/mods-available/oboe.conf'
    $java_agent_package        = 'tracelytics-java-agent'
    $java_agent_native_package = 'tracelytics-java-agent-native'
    $libcurl_package           = 'libcurl3'
    $libcurl_version           = '7.22.0-3ubuntu4+tracelytics2'
    $nginx_mod_oboe_config     = '/etc/nginx/conf.d/oboe.conf'
    $php_oboe_package          = 'php-oboe'
    $python_package            = 'python'
    $python_dev_package        = 'python-dev'
    $ruby_oboe_package         = 'oboe'
    $ruby_oboe_fu_package      = 'oboe-fu'
    $tracelyzer_service        = 'tracelyzer'
    $tracelyzer_package        = 'tracelyzer'
    $tracelytics_config        = '/etc/tracelytics.conf'
    $liboboe_package           = 'liboboe0'
    $liboboe_dev_package       = 'liboboe-dev'
  } else {
    fail("Class['apache::params']: Unsupported osfamily: ${::osfamily}")
  }
}