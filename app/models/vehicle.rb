class Vehicle < ApplicationRecord
  self.inheritance_column = nil  
  belongs_to :trucker

  validates :type, presence: { message: "Informe o tipo de veiculo" } 
  validates :body_type, presence: { message: "Informe o tipo do corpo" }
    
end
