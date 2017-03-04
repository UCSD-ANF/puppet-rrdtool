require 'spec_helper'

describe 'rrdtool::devel' do
  describe 'on Solaris' do
    let(:facts) { {
      :operatingsystem => 'Solaris',
      :osfamily        => 'Solaris',
    } }

    it { should contain_package('rrdtool-devel').with({
      'provider' => 'pkgutil',
      'name'     => 'rrdtool_dev',
    }) }
  end

  describe 'on CentOS' do
    let(:facts) { {
      :operatingsystem => 'CentOS',
      :osfamily        => 'RedHat',
    } }

    # Make sure the Solaris provider override doesn't leak
    it { should contain_package('rrdtool-devel').with({
      'provider' => nil,
      'name'     => 'rrdtool-devel',
    }) }
  end

end
