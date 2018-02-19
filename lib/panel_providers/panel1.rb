module PanelProviders
  class Panel1 < Base

    def price(fetcher = PanelProviders::Fetchers::Web.new,
              calculator = PanelProviders::Calculators::Letters.new)
      data = fetcher.fetch_data('http://time.com')

      calculator.process(data)
    end
  end
end
