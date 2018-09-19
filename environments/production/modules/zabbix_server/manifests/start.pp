class zabbix_server::start (
  $dbhost = 'localhost',
  $dbname = 'zabbix',
  $dbuser = 'zabbix',
  $dbpass = 'zabbix',
){
  
  file { "/etc/zabbix/zabbix_server.conf":
    content => template('zabbix_server/zabbix_server.conf.erb'),
    notify  => Service['zabbix-server'],
  }
  
  exec { 'uncomment_time_zone':
    command => "sed -i '/date.timezone/ s/# //' /etc/httpd/conf.d/zabbix.conf",
    path      => '/sbin:/bin:/usr/sbin:/usr/bin',
  } 

  exec { 'change_time_zone':
    command => "sed -i '/date.timezone/ s/Europe\/Riga/Europe\/Minsk/' /etc/httpd/conf.d/zabbix.conf",
    path      => '/sbin:/bin:/usr/sbin:/usr/bin',
    require => Exec['uncomment_time_zone'],
    notify  => Service['httpd'],
  }
  
  file { "/etc/zabbix/web/zabbix.conf.php":
    content => template('zabbix_server/zabbix.conf.php.erb'),
  }  

  service { 'zabbix-server':
    ensure => running,
  }

  service { 'httpd':
    ensure => running,
  }

  service { 'zabbix-agent':
    ensure => running,
  }
}
