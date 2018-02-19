class DummyHtmlFetcher < PanelProviders::Fetchers::Base

  def fetch_data(url)
    '<p>a</p>' * 1000
  end
end
