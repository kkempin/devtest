require 'rails_helper'

RSpec.describe PanelProvider, type: :model do
  it { should have_many(:countries) }
  it { should have_many(:location_groups) }
  it { should validate_presence_of(:code) }
end
