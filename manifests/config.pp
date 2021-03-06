# Class: storm::config
#
# This module manages the storm configuration directories
#
# Parameters: None
#
# Actions: None
#
# Requires: storm::install, storm
#
# Sample Usage: include storm::config
#
class storm::config(
  $java_library_path = ['/usr/local/lib', '/opt/local/lib', '/usr/lib'],
  $local_dir         = '/usr/lib/storm/storm-local',
  $user              = 'root',
  $home              = '/usr/lib/storm',
  $version           = '0.9.1',
  $lib               = '/usr/lib/storm/lib',
  $jar               = '/usr/lib/storm/storm-${STORM_VERSION}.jar',
  $conf              = '/etc/storm',
  $classpath         = ['$STORM_LIB/*.jar', '$STORM_JAR', '$STORM_CONF'],
  $options           = [''],
) {

 # file { '/etc/storm/storm.yaml':
 #   content => template('storm/storm.yaml.erb'),
 #   owner   => 'root',
 #   group   => 'root',
 #   mode    => '0644',
 #   require => Package['storm'],
 # }

  file { '/etc/default/storm':
    content => template('storm/default.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['storm'],
  }

}
