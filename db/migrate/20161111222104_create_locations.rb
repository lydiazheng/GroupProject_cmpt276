class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.text :description
      t.integer :points
      t.string :hint1
      t.string :hint2
      t.integer :hint1_points
      t.integer :hint2_points
      t.string :area

      t.timestamps null: false
    end
  end
end
