class rrdtool (
  $ensure = 'installed'
) {
  ### Module's internal variables

  $manage_package_name = 'rrdtool'

  $manage_package_ensure = $ensure

  $manage_package_provider = $::osfamily ? {
    'Darwin'  => 'macports',
    'Solaris' => 'pkgutil',
    default   => undef,
  }

  ### Managed resources

  # Set default provider for this class and subclasses
  Package {
    provider => $manage_package_provider,
  }

  package { 'rrdtool' :
    name => $manage_package_name,
  }
}
