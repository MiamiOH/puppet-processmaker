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
  String $enable_selinux,
) {

  include ::selinux

  package { $pm_rpm_name :
    ensure => present,
  }

  file { $pm_server_root:
    ensure  => directory,
    owner   => $pm_user,
    group   => $pm_group,
    recurse => true,
  }

  if is_string($enable_selinux) {
    $selinux_enabled = str2bool($enable_selinux)
  } else {
    $selinux_enabled = $enable_selinux
  }
  if $selinux_enabled == true {
    selinux::fcontext { 'set selinux processmaker home':
      seltype  => 'httpd_sys_content_t',
      pathspec => "${pm_server_root}(/.*)?",
    } ~> selinux::exec_restorecon { "${pm_server_root}/logs": }
  }
}
