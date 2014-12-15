require 'spec_helper'

describe 'ssd' do

  context 'on unsupported distributions' do
    let(:facts) do
      {
        :osfamily => 'Unsupported'
      }
    end

    it do
      expect { subject }.to raise_error(/not supported on an Unsupported/)
    end
  end

  context 'on RedHat', :compile do
    let(:facts) do
      {
        :osfamily => 'RedHat'
      }
    end

    it do
      should contain_class('ssd')
      should contain_exec('udevadm trigger --subsystem-match=block')
      should contain_file('/etc/udev/rules.d/60-ssd.rules')
    end
  end
end
