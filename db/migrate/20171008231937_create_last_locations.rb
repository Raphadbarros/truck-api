class CreateLastLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :last_locations do |t|
      t.string :city
      t.string :state
      t.references :trucker, foreign_key: true

      t.timestamps
    end
  end
end
