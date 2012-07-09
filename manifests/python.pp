class rrdtool::python (
  $ensure = $rrdtool::ensure
) inherits rrdtool {
  ### Class's internal variables

  $manage_package_name = $::osfamily ? {
    'Solaris' => 'py_rrdtool',
    default   => 'rrdtool-python',
  }

  $manage_package_ensure = $ensure

  ### Managed resources
  package {'rrdtool-python' :
    ensure => $manage_package_ensure,
    name   => $manage_package_name,
  }

}
