class rrdtool::perl (
  $ensure = $rrdtool::ensure
) inherits rrdtool {
  ### Class's internal variables

  $manage_package_name = $::osfamily ? {
    'Solaris' => 'pm_rrdtool',
    default   => 'rrdtool-perl',
  }

  $manage_package_ensure = $ensure

  ### Managed resources
  package {'rrdtool-perl' :
    ensure => $manage_package_ensure,
    name   => $manage_package_name,
  }

}
