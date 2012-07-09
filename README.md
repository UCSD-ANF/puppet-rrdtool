puppet-rrdtool
==============

Puppet module to manage RRDTool

Version 0.1

Usage:

    include 'rrdtool'

    # Bring in python bindings
    include 'rrdtool::python'

    # Ensure the development packages are missing
    class { 'rrdtool::devel': ensure => 'absent' }
