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
  String $casurl,
  Integer $casenabled,
) {

  contain '::processmaker::extension'
  contain '::processmaker::config'

  package { $pm_rpm_name :
    ensure => latest,
  }
  -> Class['::processmaker::extension']
  -> Class['::processmaker::config']

}
