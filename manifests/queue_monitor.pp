# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include processmaker
class processmaker::queue_monitor {

  if $processmaker::monitor_queue {

    contain 'processmaker::queue_monitor'

    service { 'supervisord':
      ensure  => running,
      enable  => true,
      require => Package['supervisor'],
    }

    package { 'supervisor':
      ensure => 'installed',
      before => [
        File['/etc/supervisord.d/laravel-worker-workflow.ini']
      ],
    }

    file { '/etc/supervisord.d/laravel-worker-workflow.ini':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/workflow.ini.erb"),
      notify  => Exec['reread workflow'],
    }

    exec { 'reread workflow':
      command     => '/usr/bin/supervisorctl reread && /usr/bin/supervisorctl update && /usr/bin/supervisorctl start laravel-worker-workflow:*',
      refreshonly => true,
    }
  }
}
