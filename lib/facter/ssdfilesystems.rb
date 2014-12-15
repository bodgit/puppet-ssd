Facter.add(:ssdfilesystems) do

  confine :kernel => 'Linux'

  setcode do
    devices = Facter.value(:ssddevices).split(/,/).join(' ')
    Facter::Core::Execution.exec("lsblk -n -o MOUNTPOINT #{devices}").split("\n").reject { |l|
      l.empty? || l !~ /^\//
    }.uniq.join(',')
  end
end
