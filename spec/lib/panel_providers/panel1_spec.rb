require 'rails_helper'

describe PanelProviders::Panel1 do

  it 'should return number of letters "a" divided by 100' do
    service = described_class.new
    expect(service.price(DummyHtmlFetcher.new)).to eq(10)
  end
end
