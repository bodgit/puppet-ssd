require 'facter/util/file_read'

Facter.add(:ssddevices) do

  confine :kernel => 'Linux'

  setcode do
    devices = Facter.value(:blockdevices).split(/,/).select { |device|
      Facter::Util::FileRead.read(File.join('/sys/block', device, 'queue/rotational')) == "0\n"
    }.join(',')
  end
end
