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

require 'timezonedb/client/version'
require 'timezonedb/client/response'
require 'timezonedb/client/error'

require 'rest-client'

module Timezonedb
  class Client
    URL = 'http://api.timezonedb.com'

    def initialize(api_key)
      @api_key = api_key
    end

    def search_by_coords(latitude, longitude)
      params = { key: @api_key, lat: latitude, lng: longitude, format: 'json' }

      response = RestClient.get URL, params: params
      response_hash = JSON.parse(response)

      if response_hash['status'] == 'OK'
        Response.new(response_hash)
      else
        fail Timezonedb::Client::Error.new(response_hash['message'])
      end
    rescue RestClient::Exception => e
      raise Timezonedb::Client::Error.new(e.inspect)
    end
  end
end
