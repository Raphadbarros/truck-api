class ShipmentVehicle < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :shipment
  
end
