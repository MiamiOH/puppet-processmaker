# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include processmaker
class processmaker (
  String $pm_user,
  String $pm_group,
  Stdlib::Absolutepath $pm_server_root,
  String $pm_rpm_name,
) {
  package { $pm_rpm_name :
    ensure => present,
  }

  file { $pm_server_root:
    ensure  => directory,
    mode    => '0755',
    owner   => $pm_user,
    group   => $pm_group,
    recurse => 'true'
  }

}
