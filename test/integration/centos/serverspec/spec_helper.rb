require 'serverspec'

set :backend, :exec

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end
