module PanelProviders
  class Panel3 < Base

    def price(fetcher = PanelProviders::Fetchers::Web.new,
              calculator = PanelProviders::Calculators::HtmlNodes.new)
      data = fetcher.fetch_data('http://time.com')

      calculator.process(data)
    end
  end
end
