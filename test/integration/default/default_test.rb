describe file '/etc/pam.d/su' do
  it { should be_file }
  its('mode') { should cmp '0644' }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }

  its('content') do
    if os[:name] == 'ubuntu'
      should include 'session optional pam_limits.so'
      should include 'auth sufficient pam_rootok.so'
      should include '@include common-auth'
    elsif os[:name] == 'centos'
      should eq "session optional pam_limits.so \n"
    else
      pending('a content assertion for your OS family')
    end
  end
end
