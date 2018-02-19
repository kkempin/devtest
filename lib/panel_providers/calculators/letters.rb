module PanelProviders
  module Calculators
    class Letters < Base
      LETTER = 'a'
      DIVIDER = 100

      def process(data)
        data.count(LETTER) / DIVIDER
      end
    end
  end
end
