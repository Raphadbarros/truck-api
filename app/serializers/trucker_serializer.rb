class TruckerSerializer < ActiveModel::Serializer
  has_many :vehicle
  attributes :id, :name, :phone
end
