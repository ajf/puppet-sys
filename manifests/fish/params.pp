# == Class: sys::bash::params
#
# Platform-dependent parameters for the fish shell.
#
class sys::fish::params {
  case $::osfamily {
    openbsd: {
      include sys::openbsd::pkg
      $source  = $sys::openbsd::pkg::source
      $package = 'fish'
      $path    = '/usr/local/bin/fish'
    }
    redhat: {
      $package  = 'fish'
      $path     = '/bin/fish'
    }
    debian: {
      $package  = 'fish'
      $path     = '/bin/fish'
    }
    archlinux: {
      $package  = 'fish'
      $path     = '/usr/bin/fish'
    }
    default: {
      fail("Don't know how to install bash on ${::osfamily}.\n")
    }
  }
}
