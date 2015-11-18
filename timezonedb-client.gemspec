# Copyright 2015 Skyscanner Limited.
#
# Licensed under the Apache License, Version 2.0 (the "License");
#
# you may not use this file except in compliance with the License.
#
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#
# See the License for the specific language governing permissions and
# limitations under the License.

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timezonedb/client/version'

Gem::Specification.new do |s|
  s.name          = 'timezonedb-client'
  s.version       = Timezonedb::Client::VERSION
  s.date          = '2015-11-18'
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
