# Class: processmaker::params
#
# This class manages processmaker parameters
#
# Parameters:
# - The $user that processmaker runs as
# - The $group that processmaker runs as
# - The $server_root_ is the root folder  of the package and service on the relevant
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class processmaker::params {

  $pm_user                 = 'apache'
  $pm_group                = 'apache'
  $pm_server_root          = '/opt/processmaker'

}
