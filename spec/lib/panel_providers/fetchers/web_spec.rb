require 'rails_helper'

describe PanelProviders::Fetchers::Web do

  it 'should return true if token is correct' do
    service = described_class.new
    VCR.use_cassette("google_pl") do
      data = service.fetch_data('http://www.google.pl')
      expect(data).to include('Google')
    end
  end
end
