
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
      params = {
        key: @api_key,
        lat: latitude,
        lng: longitude,
        format: 'json'
      }

      response = RestClient.get URL, params: params
      response_hash = JSON.parse(response)

      fail Error.new "Request failed - #{response_hash['message']}" unless response_hash['status'] == 'OK'

      Response.new(response_hash)
    rescue RestClient::Exception => e
      raise Error.new e.inspect
    end
  end
end
