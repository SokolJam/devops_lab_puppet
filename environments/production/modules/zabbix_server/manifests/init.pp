class zabbix_server {
  package { 'zabbix-server-mysql':
    ensure   => present,
  }
  
  package { 'zabbix-web-mysql':
    ensure   => present,
  }
  
  package { 'zabbix-agent':
    ensure   => present,
  }

  include zabbix_server::start   
}
