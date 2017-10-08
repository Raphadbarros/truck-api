class CreateOrigins < ActiveRecord::Migration[5.1]
  def change
    create_table :origins do |t|
      t.string :city
      t.string :state
      t.datetime :load_at
      t.references :shipment, foreign_key: true

      t.timestamps
    end
  end
end
