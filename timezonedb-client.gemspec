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
  s.date          = '2016-02-03'
  s.summary       = 'Timezonedb Client'
  s.description   = 'A client for accessing the timezonedb.com API'
  s.authors       = ['Kostis Dadamis', 'Emili Parreno']
  s.email         = ['kostis.dadamis@skyscanner.net', 'emili.parreno@skysacnenr.net']
  s.homepage      = 'https://github.com/Skyscanner/timezonedb-client-ruby'
  s.license       = 'Apache License, Version 2.0'

  s.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.test_files    = s.files.grep(%r{^spec/})
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.0.0'

  s.add_runtime_dependency 'rest-client', '~> 2.1.0'
  s.add_runtime_dependency 'json', '~> 2.0.0'

  s.add_development_dependency 'rake', '~> 10.4.2'
  s.add_development_dependency 'rspec', '~> 3.4.0'
  s.add_development_dependency 'rack-test', '~> 0.6.3'
  s.add_development_dependency 'webmock', '~> 1.22.3'
end
