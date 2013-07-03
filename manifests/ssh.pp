# == Class: sys::ssh
#
# This class installs and configures SSH.
#
# == Parameters
# [*port*]
#  The port that the SSH daemon will listen on, defaults to 22.
#
# [*acceptenv*]
#  Array that specifies what environment variables sent by the client
#  will be copied into the client session's environment (on non-Solaris
#  systems).  Defaults to `[ 'LANG', 'LC_*' ]`.
#
# [*allowusers*]
#  An array of users allowed SSH access; maps to the AllowUsers
#  `sshd_config` variable.  Defaults to false.
#
# [*allowgroups*]
#  An array of groups allowed SSH access; maps to the AllowGroups
#  `sshd_config` variable.  Defaults to false.
#
# [*denyusers*]
#  An array of users denied SSH access; maps to the DenyUsers
#  `sshd_config` variable.  Defaults to false.
#
# [*denygroups*]
#  An array of groups denied SSH access; maps to the DenyGroups
#  `sshd_config` variable.  Defaults to false.
#
# [*challenge_response*]
#  Specifies whether challenge-response authentication is allowed,
#  defaults to true.
#
# [*empty_passwords*]
#  Whether or not to allow empty passwords, defaults to false.
#
# [*login_grace_time*]
#  Time (in seconds) that the SSH daemon will disconnect if the
#  user has not successfully logged in.  Defaults to 120.
#
# [*root_login*]
#  Determines whether root logins are permitted, defaults to false.
#
# [*rsa_auth*]
#  Determines whether pure RSA authentication is allowed when SSH
#  protocol 1 is used, defaults to true.
#
# [*pubkey_auth*]
#  Specifies whether public key authentication is allowed, defaults to true.
#
# [*password_auth*]
#  Determines whether password authentication is allowed, defaults to false.
#
# [*privilege_separation*]
#  Enables privilege separation for the SSH daemon, defaults to true.
#
# [*protocol*]
#  The SSH protocol to use, defaults to 2.  May be a list, ordered by
#  accepted priority (e.g., `protocol => [2, 1]`).
#
# [*sftp*]
#  Whether or not to enable the SFTP subsystem, defaults to true.
#
# [*strict_modes*]
#  Determines whether the SSH daemone should check file permissions and
#  and ownership of the user's files and home directory before allowing
#  a login (e.g., checking whether ~/.ssh is world-readable).  Defaults
#  to true.
#
# [*tcp_forwarding*]
#  Allows TCP forwarding by the SSH daemon, defaults to false.
#
# [*tcp_keepalive*]
#  Determines whether TCP "keepalive" packets are sent to clients, defaults
#  to true.
#
# [*use_dns*]
#  Whether or not the SSH daemon should perform name lookups on the remote
#  host and that it maps back, defaults to true.
#
# [*x11_forwarding*]
#  Allows X11 forwarding by the SSH daemon, defaults to false.
#
class sys::ssh(
  $port                 = 22,
  $acceptenv            = [ 'LANG', 'LC_*' ],
  $allowusers           = false,
  $allowgroups          = false,
  $denyusers            = false,
  $denygroups           = false,
  $challenge_response   = false,
  $empty_passwords      = false,
  $login_grace_time     = 120,
  $root_login           = false,
  $rsa_auth             = true,
  $pubkey_auth          = true,
  $password_auth        = false,
  $privilege_separation = true,
  $protocol             = 2,
  $sftp                 = true,
  $strict_modes         = true,
  $agent_forwarding     = false,
  $tcp_forwarding       = false,
  $tcp_keepalive        = true,
  $use_dns              = true,
  $x11_forwarding       = false,
){
  anchor { 'sys::ssh::start': }  ->
  class { 'sys::ssh::params': }  ->
  class { 'sys::ssh::install': } ->
  class { 'sys::ssh::config': }  ->
  class { 'sys::ssh::service': } ->
  anchor { 'sys::ssh::end': }
}