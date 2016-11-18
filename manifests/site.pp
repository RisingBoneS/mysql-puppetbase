class { 'java' :
 package => 'java-1.8.0-openjdk-devel',
}
class { '::mysql::server':
  root_password           => 'root',
  remove_default_accounts => false,
  override_options        => { 'mysqld' => { 'bind_address' => '0.0.0.0' } } 
}
mysql::db { 'musicgroup':
  user     => 'musicg',
  password => 'password1',
  host     => 'localhost',
  grant    => ['ALL'],
}
class { '::mysql::server::backup':
  backupuser      => 'mgbck',
  backuppassword  => 'mgbck1',
  backupdir       => '/root/mysql_backup',
  backupdirmode   => '0700',
  backupdirowner  => 'root',
  backupdirgroup  => 'root',
  backuprotate    =>  7,
  backupcompress  => 'true',
  time            => ['00','05']
}
