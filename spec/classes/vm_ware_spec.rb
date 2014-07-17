require 'spec_helper'

describe 'vmware_tools' do
	let (:params) {{ :vmware_tools_service =>'vmware-tools',:vmware_tools_service_ensure=>'running',:vmware_tools_pattern=>'vmtoolsd',\
	:vmware_tools_has_restart=>'false',:vmware_tools_restart=>'/sbin/stop vmware-tools;/sbin/start vmware-tools',\
	:vmware_tools_start=>'/sbin/stop vmware-tools;/sbin/start vmware-tools',:vmware_tools_stop=>'/sbin/stop vmware-tools',\
	:vmware_tools_provider=>'redhat',:vmware_tools_hasstatus =>'false'}}

	context 'With RedHat and VMware' do
		let (:facts) {{ :osfamily => 'redhat',:virtual =>'vmware'}}
		it { should contain_class('vmware_tools') }
		it { should contain_class('vmware_tools::params') }
		it { should contain_service('vmware-tools').with('ensure' =>'running','pattern' =>'vmtoolsd','hasrestart'=>'false',\
		'restart' =>'/sbin/stop vmware-tools;/sbin/start vmware-tools','start'=>'/sbin/stop vmware-tools;/sbin/start vmware-tools',\
		'stop'=>'/sbin/stop vmware-tools','provider'=>'redhat','hasstatus'=>'false')}
	
	end
	
	context 'With RedHat and Virtualbox' do
		let (:facts) {{ :osfamily => 'redhat',:virtual =>'virtualbox'}}
		it{ expect {should compile}.to raise_error(Puppet::Error, /Module vmware_tools is not supported on virtualbox/)}
	end	

	context 'Without RedHat' do
	let(:facts) {{:osfamily=>'solaris',:operatingsystem=>'solaris'}}
	it{ expect {should compile}.to raise_error(Puppet::Error, /Module vmware_tools is not supported on solaris/)}
	
	end

end
