module PanelProviders
  module Calculators
    class Base

      def process(data)
        raise NotImplementedError
      end
    end
  end
end
