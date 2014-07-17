class vmware_tools (
  $vmware_tools_service               = $vmware_tools::params::vmware_tools_service,
  $vmware_tools_service_ensure        = $vmware_tools::params::vmware_tools_service_ensure,
  $vmware_tools_pattern               = $vmware_tools::params::vmware_tools_pattern,
  $vmware_tools_has_restart           = $vmware_tools::params::vmware_tools_has_restart,
  $vmware_tools_restart               = $vmware_tools::params::vmware_tools_restart,
  $vmware_tools_stop                  = $vmware_tools::params::vmware_tools_stop,
  $vmware_tools_start                 = $vmware_tools::params::vmware_tools_start,
  $vmware_tools_provider              = $vmware_tools::params::vmware_tools_provider,
  $vmware_tools_hasstatus             = $vmware_tools::params::vmware_tools_hasstatus,
) inherits vmware_tools::params {

if ($::virtual  == 'vmware') {
    service { $vmware_tools_service:
      ensure     => $vmware_tools_service_ensure,
      pattern    => $vmware_tools_pattern,
      hasrestart => $vmware_tools_hash_restart,
      restart    => $vmware_tools_restart,
      start      => $vmware_tools_start,
      stop       => $vmware_tools_stop,
      provider   => $vmware_tools_provider,
      hasstatus  => $vmware_tools_hasstatus,
    }
  }
}
