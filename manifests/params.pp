#
class ssd::params {

  case $::osfamily {
    'RedHat': {
      $fstrim_all_supported = false
      $readahead            = 2048
      $scheduler            = 'noop'
      $udev_rule_file       = '/etc/udev/rules.d/60-ssd.rules'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.") # lint:ignore:80chars
    }
  }
}
