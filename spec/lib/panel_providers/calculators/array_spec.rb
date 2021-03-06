require "rails_helper"

describe PanelProviders::Calculators::Array do
  let(:json) do
    '{
      "docs": [
        {
          "1": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
          "2": "12345678901234567890",
          "3": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
          "4": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
          "5": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
          "6": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
          "7": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
          "8": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
          "9": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
          "10": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
          "11": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
          "12": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        }
      ]
    }'
  end

  it "should return number of arrays with more that 10 elements" do
    service = described_class.new
    expect(service.process(json.to_s)).to eq(11)
  end
end
