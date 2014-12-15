#
class ssd::install {

  # Almost certainly installed
  ensure_packages(['systemd', 'util-linux'])
}
