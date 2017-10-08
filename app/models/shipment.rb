class Shipment < ApplicationRecord
    has_one :contact
    has_many :shipment_vehicle
    has_one :origin
    has_one :destination
    accepts_nested_attributes_for :shipment_vehicle, :contact, :origin, :destination

    
end
