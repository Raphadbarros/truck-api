class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.integer :origin_id
      t.integer :destination_id
      t.datetime :load_at
      t.datetime :delivered_at
      t.references :shipment, foreign_key: true

      t.timestamps
    end
  end
end
