# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include processmaker
class processmaker::extension {

  include '::php'

  php::extension { ['xml', 'gd', 'soap', 'ldap', 'mbstring', 'mcrypt', 'pecl-apcu']:
    ensure => present,
  }

}
