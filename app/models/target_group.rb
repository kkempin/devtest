class TargetGroup < ActiveRecord::Base
  belongs_to :panel_provider
  has_and_belongs_to_many :countries

  belongs_to :parent, class_name: 'TargetGroup'
  has_many :children, class_name: 'TargetGroup', foreign_key: 'parent_id'

  validates :secret_code, uniqueness: true

  scope :roots, -> { where(parent_id: nil) }
end
