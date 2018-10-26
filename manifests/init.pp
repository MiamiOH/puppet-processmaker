# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include processmaker
class processmaker (
  $user            = $::processmaker::params::user,
  $group           = $::processmaker::params::group,
  $server_root     = $::processmaker::params::server_root,
  ) {
  package { 'processmaker' :
    ensure => present,
  }
}
