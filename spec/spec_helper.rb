
require 'rack/test'
require 'rspec'
require 'webmock/rspec'

require_relative '../lib/timezonedb-client.rb'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
