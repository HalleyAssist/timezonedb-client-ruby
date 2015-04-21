
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
