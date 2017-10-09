class Origin < ApplicationRecord
  belongs_to :shipment

  validates :city, presence: { message: "Informe a cidade" }
  validates :state, presence: { message: "Informe o estado" }
  validates :load_at, presence: { message: "Informe a data de entrega" }

end
