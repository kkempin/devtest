require 'rails_helper'

RSpec.describe TargetGroup, type: :model do
  it { should belong_to(:panel_provider) }
  it { should have_and_belong_to_many(:countries) }
  it { should have_many(:children) }
end
