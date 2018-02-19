class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :external_id, :secret_code
end
