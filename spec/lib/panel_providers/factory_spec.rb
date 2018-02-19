require 'rails_helper'

describe PanelProviders::Factory do
  let(:panel_provider) { create(:panel_provider, code: 'Panel1') }
  let(:panel_provider_wrong) { create(:panel_provider, code: '123') }

  it 'should make proper panel provider' do
    provider = described_class.make(panel_provider)
    expect(provider).to be_kind_of(PanelProviders::Panel1)
  end

  it 'should raise an error if provider class doesnt exist' do
    expect {
      described_class.make(panel_provider_wrong)
    }.to raise_error(NameError)
  end
end
