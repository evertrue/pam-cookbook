require 'spec_helper'

describe 'pam::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) { ChefSpec::ServerRunner.new.converge described_recipe }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
