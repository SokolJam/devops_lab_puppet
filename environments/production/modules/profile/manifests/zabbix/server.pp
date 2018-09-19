class profile::zabbix::server {
  class {'zabbix_repo':}
  class {'zabbix_server':}
  mysql::db { 'zabbix':
    user     => 'zabbix',
    password => 'zabbix',
    host     => 'localhost',
    grant    => ['ALL'],
    sql      => '/usr/share/doc/zabbix-server-mysql-*/create.sql.gz',
    import_cat_cmd => 'zcat',
    import_timeout => 900,
  }
  
}
