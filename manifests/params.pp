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

  $user                 = 'apache'
  $group                = 'apache'
  $server_root          = '/opt/processmaker'

}
