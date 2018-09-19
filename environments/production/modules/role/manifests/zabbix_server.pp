class role::zabbix_server {
  include profile::mysql::server
  include profile::zabbix::server
}
