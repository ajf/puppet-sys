# == Class: sys::bash
#
# This class installs the fish shell.
#
# === Parameters
#
# [*ensure*]
#  The ensure value for the bash package resources, defaults to 'installed'.
#
# [*package*]
#  The name of the bash package to install, default is platform-dependent.
#
# [*source*]
#  The source for the package resource, default is platform-dependent.
#
# [*provider*]
#  The provider for the package resource, default is platform-dependent.
#
class sys::fish (
  $ensure   = 'installed',
  $package  = $sys::fish::params::package,
  $source   = $sys::fish::params::source,
  $provider = $sys::fish::params::provider,
) inherits sys::fish::params {
  if $package {
    package { $package:
      ensure   => $ensure,
      source   => $source,
      provider => $provider,
    }
  }
}
