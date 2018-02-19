require 'rails_helper'

describe PanelProviders::Panel2 do

  it 'should return number of arrays with more than 10 elements' do
    service = described_class.new
    expect(service.price(DummyJsonFetcher.new)).to eq(11)
  end
end
