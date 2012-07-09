require 'spec_helper'

describe 'rrdtool::python' do
  describe 'on Solaris' do
    let(:facts) { {
      :operatingsystem => 'Solaris',
      :osfamily        => 'Solaris',
    } }

    it { should contain_package('rrdtool-python').with({
      'provider' => 'pkgutil',
      'name'     => 'py_rrdtool',
    }) }
  end

  describe 'on CentOS' do
    let(:facts) { {
      :operatingsystem => 'CentOS',
      :osfamily        => 'RedHat',
    } }

    # Make sure the Solaris provider override doesn't leak
    it { should contain_package('rrdtool-python').with({
      'provider' => /^((?!pkgutil).)*$/,
      'name'     => 'rrdtool-python',
    }) }
  end

end
