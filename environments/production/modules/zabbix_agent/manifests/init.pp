class zabbix_agent (
  $zabbix_server = '',
  $user      = 'Admin',
  $pass      = 'zabbix',  
) {

  package { 'zabbix-agent':
    ensure   => present,
  }

  file { "/etc/zabbix/zabbix_agentd.conf":
    content => template('zabbix_agent/zabbix_agentd.conf.erb'),
    notify  => Service['zabbix-agent'],
  }

  service { 'zabbix-agent':
    ensure  => running,
    require => Package['zabbix-agent'],
  }
 
  file { "/tmp/zabbix_add_host.py":
    content => template('zabbix_agent/zabbix_add_host.py.erb'),
    require => Service['zabbix-agent'],
    ensure  => 'present',
    mode    => '0755',
  }

  exec { 'agent_auto_reg':
    command => "/tmp/zabbix_add_host.py",
    path    => '/usr/bin/python',
    require => File['/tmp/zabbix_add_host.py'],
  }
}
