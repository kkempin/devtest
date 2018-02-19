require 'rails_helper'

describe Authentication::TokenChecker do
  it 'should return true if token is correct' do
    service = described_class.new('token')

    expect(service.check).to be(true)
  end

  it 'should return false if token is correct' do
    service = described_class.new('wrong token')

    expect(service.check).to be(false)
  end
end
