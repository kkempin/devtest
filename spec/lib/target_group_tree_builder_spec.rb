require 'rails_helper'

describe TargetGroupTreeBuilder do
  let(:panel_providers) do
    [ create(:panel_provider), create(:panel_provider), create(:panel_provider) ]
  end

  let(:target_group) { create(:target_group) }
  let!(:service) { described_class.new(panel_providers) }

  it 'should create branch with 3 levels deep' do
    service.run(target_group)

    expect {
      first_child = target_group.reload.children.first
      second_child = first_child.children.first
      third_child = second_child.children.first
    }.to_not raise_error
  end
end
