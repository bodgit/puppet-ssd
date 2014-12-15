#
class ssd::config {

  $readahead = $::ssd::readahead
  $scheduler = $::ssd::scheduler

  file { $::ssd::udev_rule_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('ssd/udev.rules.erb'),
  }
}
