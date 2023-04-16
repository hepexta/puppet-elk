# elk::filebeat
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include elk::filebeat
class elk::filebeat (
  $prospectors = [],
) {
  package {'filebeat':
    ensure => present,
  }
  include elastic_stack::repo
  Elk::Filebeat_config <<| title == "main" |>> { 
    prospectors => $prospectors
  } 
  service{'filebeat':
    ensure => running,
    enable => true,
  }
}
