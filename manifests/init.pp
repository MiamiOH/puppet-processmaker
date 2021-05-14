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
  String $dbhostname,
  String $dbname,
  String $dbuser,
  String $dbpassword,
  String $packageensure,
  String $casurl,
  Integer $casenabled,
  String $pswsurl,
  String $pswsuser,
  String $pswspass,
  Integer $numberlogfile,
  Hash $configitems,
  Boolean $monitor_queue,
) {

  contain 'processmaker::extension'
  contain 'processmaker::config'

  if $processmaker::monitor_queue {
    contain 'processmaker::queue_monitor'
  }
  
  package { $pm_rpm_name :
    ensure => $packageensure,
  }
  -> Class['processmaker::extension']
  -> Class['processmaker::config']

}
