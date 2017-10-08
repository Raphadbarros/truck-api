class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.string :city
      t.string :state
      t.datetime :deliver_at
      t.references :shipment, foreign_key: true

      t.timestamps
    end
  end
end
