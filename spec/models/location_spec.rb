require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should have_and_belong_to_many (:location_groups) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:external_id) }
  it { should validate_presence_of(:secret_code) }
end
