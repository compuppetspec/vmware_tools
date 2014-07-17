require 'facter'

Facter.add(:vmwaretools_version) do
  confine :virtual => :vmware
  setcode do
    if File::executable?("/usr/bin/vmware-toolbox-cmd")
      result = Facter::Util::Resolution.exec("/usr/bin/vmware-toolbox-cmd -v")
      if result
        result.sub(%r{(\d*\.\d*\.\d*)\.\d*\s+\(build(-\d*)\)},'\1\2')
      else
        "not installed"
      end
    else
      "not installed"
    end
  end
end
