require 'rails_helper'

describe PanelProviders::Calculators::HtmlNodes do
  let(:html) { '<div><p><span><strong>text</strong></span></p></div>' }

  it 'should return number of html nodes divided by 100' do
    service = described_class.new
    expect(service.process(html*1000)).to eq(40)
  end
end
