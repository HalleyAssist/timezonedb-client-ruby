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

module Timezonedb
  class Client
    class Response
      attr_reader :status, :message, :country_code, :zone_name,
                  :abbreviation, :gmt_offset, :dst, :timestamp

      def initialize(response_hash)
        @message      = response_hash['message']
        @country_code = response_hash['countryCode']
        @zone_name    = response_hash['zoneName']
        @abbreviation = response_hash['abbreviation']
        @gmt_offset   = response_hash['gmtOffset']
        @dst          = response_hash['dst']
        @timestamp    = response_hash['timestamp']
      end
    end
  end
end
