# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include processmaker
class processmaker::extension {

  include 'php'

  php::extension {
    'gd':
      ensure     => present,
      ini_prefix => '20-';
    'ldap':
      ensure     => present,
      ini_prefix => '20-';
    'mbstring':
      ensure     => present,
      ini_prefix => '20-';
    'pecl-apcu':
      ensure     => present,
      ini_prefix => '40-',
      so_name    => 'apcu';
    'pecl-mcrypt':
      ensure     => present,
      ini_prefix => '30-',
      so_name    => 'mcrypt';
    'soap':
      ensure     => present,
      ini_prefix => '20-';
    'xml':
      ensure     => present,
      ini_prefix => '20-';
  }

}
