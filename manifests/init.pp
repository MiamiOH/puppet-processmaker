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
  -> file { $pm_server_root:
    ensure  => directory,
    owner   => $pm_user,
    group   => $pm_group,
    recurse => true,
  }
  if $facts['os']['family'] == 'RedHat' {
    include ::selinux
    if $facts['selinux'] == true {
      selinux::fcontext { 'set selinux processmaker home':
        ensure   => 'present',
        seltype  => 'httpd_sys_rw_content_t',
        pathspec => "${pm_server_root}(/.*)?",
      } ~> selinux::exec_restorecon { "${pm_server_root}/logs": }
    }
  }
}
