class zabbix_repo(
  $baseurl    = "http://repo.zabbix.com/zabbix/3.2/rhel/7/\$basearch/",
  $baseurlnsp = "http://repo.zabbix.com/non-supported/rhel/7/\$basearch/",
  $gpgkey     = "https://repo.zabbix.com/RPM-GPG-KEY-ZABBIX-A14FE591",
  $gpgkeynsp  = "https://repo.zabbix.com/RPM-GPG-KEY-ZABBIX",
) {
  
  file { "/etc/yum.repos.d/zabbix.repo":
    content => template('zabbix_repo/zabbix.repo.erb'), 
  }

}

