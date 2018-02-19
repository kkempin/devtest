require 'rails_helper'

describe TargetGroupsForCountryQuery do
  let(:country_code) { 'pl' }
  let(:panel_provider) { create(:panel_provider) }
  let(:country) { create(:country, country_code: country_code, panel_provider: panel_provider) }
  let!(:target_group) do
    create(:target_group, panel_provider: panel_provider, countries: [country])
  end

  let!(:target_group_2) do
    create(:target_group, panel_provider: panel_provider)
  end

  it 'should fetch target groups' do
    service = described_class.new(country_code)
    expect(service.fetch).to eq [target_group]
  end
end
