# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include processmaker
class processmaker::config {

  $configitems = $processmaker::configitems.join_keys_to_values(' = ').join("\n")

  file { $processmaker::pm_server_root:
    ensure  => directory,
    owner   => $processmaker::pm_user,
    group   => $processmaker::pm_group,
    recurse => true,
  }

  file { "${processmaker::pm_server_root}/shared/sites/workflow/databases.php":
    ensure  => file,
    owner   => $processmaker::pm_user,
    group   => $processmaker::pm_group,
    content => template("${module_name}/databases.php.erb"),
    mode    => '0640',
  }

  file { "${processmaker::pm_server_root}/shared/sites/workflow/db.php":
    ensure  => file,
    owner   => $processmaker::pm_user,
    group   => $processmaker::pm_group,
    content => template("${module_name}/db.php.erb"),
    mode    => '0640',
  }

  file { "${processmaker::pm_server_root}/workflow/engine/config/env.ini":
    ensure  => file,
    owner   => $processmaker::pm_user,
    group   => $processmaker::pm_group,
    content => template("${module_name}/env.ini.erb"),
    mode    => '0640',
  }

  if $facts['os']['family'] == 'RedHat' {
    include ::selinux
    if $facts['selinux'] == true {
      selinux::fcontext { 'set selinux processmaker home':
        ensure   => 'present',
        seltype  => 'httpd_sys_rw_content_t',
        pathspec => "${processmaker::pm_server_root}(/.*)?",
      } ~> selinux::exec_restorecon { $processmaker::pm_server_root: }
    }
  }

}
