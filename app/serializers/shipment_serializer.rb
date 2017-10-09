class ShipmentSerializer < ActiveModel::Serializer
  has_one :contact
  has_many :shipment_vehicle, key: :vehicles
  has_one :origin
  has_one :destination
  attributes :id, :value, :weight_kg
end
