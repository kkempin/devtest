class PanelProvider < ActiveRecord::Base
  has_many :countries
  has_many :location_groups

  validates :code, presence: true
end
