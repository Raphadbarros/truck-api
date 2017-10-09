class LastLocation < ApplicationRecord
  belongs_to :trucker
  validates :city, presence: { message: "Informe uma cidade" }
  validates :state, presence: { message: "Informe um estado válido" }
end
