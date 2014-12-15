#
class ssd::service {

  exec { 'udevadm trigger --subsystem-match=block':
    path        => ['/usr/sbin'],
    refreshonly => true,
  }
}
