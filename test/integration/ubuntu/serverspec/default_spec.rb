require 'spec_helper'

describe 'PAM Services' do
  context file '/etc/pam.d/su' do
    it { should be_file }
    it { should be_mode '644' }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should include 'session optional pam_limits.so' }
    its(:content) { should include 'auth sufficient pam_rootok.so' }
    its(:content) { should include '@include common-auth' }
  end
end
