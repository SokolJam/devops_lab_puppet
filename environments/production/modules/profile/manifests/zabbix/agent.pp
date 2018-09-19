class profile::zabbix::agent {
  class {'zabbix_repo':}
  class {'zabbix_agent':
    zabbix_server => lookup('profile::zabbix::agent:zabbix_server'),
  } 
}
