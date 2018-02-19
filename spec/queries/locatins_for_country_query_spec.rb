require 'rails_helper'

describe LocationsForCountryQuery do
  let(:country_code) { 'pl' }
  let(:panel_provider) { create(:panel_provider) }
  let(:country) { create(:country, country_code: country_code, panel_provider: panel_provider) }
  let(:location_group) do
    create(:location_group, country: country, panel_provider: panel_provider)
  end
  let!(:location) do
    create(:location, location_groups: [location_group])
  end

  let!(:location_2) do
    create(:location)
  end

  it 'should fetch locations' do
    service = described_class.new(country_code)
    expect(service.fetch).to eq [location]
  end
end

