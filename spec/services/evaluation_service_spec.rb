require 'rails_helper'

describe EvaluationService do
  let(:country_code) { 'pl' }
  let(:panel_provider) { create(:panel_provider, code: 'Panel1') }
  let(:country) { create(:country, country_code: country_code, panel_provider: panel_provider) }
  let!(:target_group) do
    create(:target_group, panel_provider: panel_provider, countries: [country])
  end
  let!(:target_group_2) do
    create(:target_group, panel_provider: panel_provider, countries: [country])
  end

  it 'should return price based on an input' do
    VCR.use_cassette("google_pl") do
      service = described_class.new(country_code, target_group.id, [])
      expect(service.calculate).to eq(77)
    end
  end

  it 'should fallback country to target_group' do
    VCR.use_cassette("google_pl") do
      service = described_class.new('ru', target_group_2.id, [])
      expect(service.calculate).to eq(77)
    end
  end
end
