require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  # ChefSpec configuration
  config.color = true
  config.formatter = :documentation
  config.platform = 'ubuntu'
  config.version = '16.04'
end
