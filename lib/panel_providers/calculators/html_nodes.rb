module PanelProviders
  module Calculators
    class HtmlNodes < Base
      DIVIDER = 100

      def process(data)
        html = Nokogiri::HTML(data)
        html.xpath("//*").count / DIVIDER
      end
    end
  end
end
