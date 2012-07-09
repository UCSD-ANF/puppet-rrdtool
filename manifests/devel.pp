class rrdtool::devel (
  $ensure = $rrdtool::ensure
) inherits rrdtool {
  ### Class's internal variables

  $manage_package_name = $::osfamily ? {
    'Solaris' => 'rrdtool_dev',
    default   => 'rrdtool-devel',
  }

  $manage_package_ensure = $ensure

  ### Managed resources
  package {'rrdtool-devel' :
    ensure => $manage_package_ensure,
    name   => $manage_package_name,
  }

}
