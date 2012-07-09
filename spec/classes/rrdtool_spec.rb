require 'spec_helper'

describe 'rrdtool' do
  describe 'on Solaris' do
    let(:facts) { {
      :operatingsystem => 'Solaris',
      :osfamily        => 'Solaris',
    } }

    it { should contain_package('rrdtool').with({
      'provider' => 'pkgutil',
      'name'     => 'rrdtool',
    }) }
  end

  describe 'on CentOS' do
    let(:facts) { {
      :operatingsystem => 'CentOS',
      :osfamily        => 'RedHat',
    } }

    # Make sure the Solaris provider override doesn't leak
    it { should contain_package('rrdtool').with({
      'provider' => /^((?!pkgutil).)*$/,
      'name'     => 'rrdtool',
    }) }
  end

end
