# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include processmaker
class processmaker::extension {

  php::extention { ['xml', 'gd', 'soap', 'ldap', 'mbstring', 'mcrypt', 'devel', 'pecl-apcu']:
    ensure => present,
  }

}
