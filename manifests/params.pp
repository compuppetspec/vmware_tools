class vmware_tools::params {
  $vmware_tools_service               = 'vmware-tools'
  $vmware_tools_service_ensure        = 'running'
  $vmware_tools_pattern               = 'vmtoolsd'
  $vmware_tools_has_restart           = false
  $vmware_tools_restart               = '/sbin/stop vmware-tools;/sbin/start vmware-tools'
  $vmware_tools_stop                  = '/sbin/stop vmware-tools'
  $vmware_tools_start                 = '/sbin/stop vmware-tools;/sbin/start vmware-tools'
  $vmware_tools_provider              = 'redhat'
  $vmware_tools_hasstatus             = false

  validate_bool($vmware_tools_has_restart)
  validate_bool($vmware_tools_hasstatus)
  validate_string($vmware_tools_ensure)
  validate_string($vmware_tools_service)
  validate_string($vmware_tools_service_ensure)
  validate_string($vmware_tools_restart)
  validate_string($vmware_tools_pattern)
  case $::osfamily {
    'redhat': {}
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}

