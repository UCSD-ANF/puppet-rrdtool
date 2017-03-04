require 'spec_helper'

describe 'rrdtool::perl' do
  describe 'on Solaris' do
    let(:facts) { {
      :operatingsystem => 'Solaris',
      :osfamily        => 'Solaris',
    } }

    it { should contain_package('rrdtool-perl').with({
      'provider' => 'pkgutil',
      'name'     => 'pm_rrdtool',
    }) }
  end

  describe 'on CentOS' do
    let(:facts) { {
      :operatingsystem => 'CentOS',
      :osfamily        => 'RedHat',
    } }

    # Make sure the Solaris provider override doesn't leak
    it { should contain_package('rrdtool-perl').with({
      'provider' => nil,
      'name'     => 'perl-rrdtool',
    }) }
  end

end
