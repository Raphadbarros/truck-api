class CreateShipments < ActiveRecord::Migration[5.1]
  def change
    create_table :shipments do |t|
      t.float :value
      t.float :weight_kg
   
      t.timestamps
    end
  end
end
