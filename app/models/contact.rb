class Contact < ApplicationRecord
  belongs_to :shipment
  validates :name, presence: { message: "Informe o nome" }
  validates :phone, presence: { message: "informe um número" }
end
