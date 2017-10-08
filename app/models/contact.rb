class Contact < ApplicationRecord
  belongs_to :shipment
  validates :name, presence: { message: "must be given please" }
end
