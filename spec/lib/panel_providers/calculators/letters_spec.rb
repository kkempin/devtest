require 'rails_helper'

describe PanelProviders::Calculators::Letters do
  let(:html) { 'a..a' }

  it 'should return number of letters "a" divided by 100' do
    service = described_class.new
    expect(service.process(html*1000)).to eq(20)
  end
end
