module PanelProviders
  class Panel2 < Base

    def price(fetcher = PanelProviders::Fetchers::Web.new,
              calculator = PanelProviders::Calculators::Array.new)
      data = fetcher.fetch_data('http://openlibrary.org/search.json?q=the+lord+of+the+rings')

      calculator.process(data)
    end
  end
end
