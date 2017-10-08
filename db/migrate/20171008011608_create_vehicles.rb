class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :type
      t.string :body_type
      t.references :trucker, foreign_key: true

      t.timestamps
    end
  end
end
