
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timezonedb/client/version'

Gem::Specification.new do |s|
  s.name          = 'timezonedb-client'
  s.version       = Timezonedb::Client::VERSION
  s.date          = '2015-04-15'
  s.summary       = 'Timezonedb Client'
  s.description   = 'A client for accessing the timezonedb.com API'
  s.authors       = ['Kostis Dadamis']
  s.email         = 'kostis.dadamis@skyscanner.net'
  s.homepage      = 'https://github.com/Skyscanner/timezonedb-client-ruby'
  s.license       = 'Apache License, Version 2.0'

  s.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.test_files    = s.files.grep(%r{^spec/})
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.0.0'

  s.add_runtime_dependency 'rest-client', '~> 1.8.0'
  s.add_runtime_dependency 'json', '~> 1.8.0'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'webmock'
end
