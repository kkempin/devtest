require 'net/http'

module PanelProviders
  module Fetchers
    class Web < Base

      def fetch_data(url)
        Net::HTTP.get_response(URI.parse(url)).body
      end
    end
  end
end
