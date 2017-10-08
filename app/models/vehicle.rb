class Vehicle < ApplicationRecord
  self.inheritance_column = nil  
  belongs_to :trucker
end
