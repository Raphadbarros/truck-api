class ShipmentSerializer < ActiveModel::Serializer
  has_one :contact
  has_many :shipment_vehicle
  attributes :id, :value, :weight_kg
end
