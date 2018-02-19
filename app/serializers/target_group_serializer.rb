class TargetGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :external_id, :secret_code

  has_many :children
end
