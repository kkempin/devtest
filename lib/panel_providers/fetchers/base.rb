module PanelProviders
  module Fetchers
    class Base

      def fetch_data
        raise NotImplementedError
      end
    end
  end
end
