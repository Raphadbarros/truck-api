class Trucker < ApplicationRecord
    has_many :vehicle
    accepts_nested_attributes_for :vehicle

    validates :name, presence: { message: "Informe o nome do caminhoneiro" }
    validates :phone, presence: { message: "Informe um telefone" }
end
