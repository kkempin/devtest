require 'rails_helper'

describe PanelProviders::Panel3 do

  it 'should return number of html nodes divided by 100' do
    service = described_class.new
    expect(service.price(DummyHtmlFetcher.new)).to eq(10)
  end
end
