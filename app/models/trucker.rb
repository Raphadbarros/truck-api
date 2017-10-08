class Trucker < ApplicationRecord
    has_many :vehicle
    accepts_nested_attributes_for :vehicle
end
