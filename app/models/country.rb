class Country < ActiveRecord::Base
  belongs_to :panel_provider
  has_many :location_groups
  has_and_belongs_to_many :target_groups

  validates :country_code, presence: true
  validates :country_code, uniqueness: true
end
