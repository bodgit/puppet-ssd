#
class ssd (
  $fstrim_all_supported = $::ssd::params::fstrim_all_supported,
  $readahead            = $::ssd::params::readahead,
  $scheduler            = $::ssd::params::scheduler,
  $udev_rule_file       = $::ssd::params::udev_rule_file
) inherits ::ssd::params {

  validate_bool($fstrim_all_supported)
  validate_re($readahead, '^\d+$')
  validate_re($scheduler, '^(noop|deadline|cfq)$')
  validate_string($udev_rule_file)

  include ::ssd::install
  include ::ssd::config
  include ::ssd::service

  anchor { 'ssd::begin': }
  anchor { 'ssd::end': }

  Anchor['ssd::begin'] -> Class['::ssd::install'] ~> Class['::ssd::config']
    ~> Class['::ssd::service'] -> Anchor['ssd::end']
}
