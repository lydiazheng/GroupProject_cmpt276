class CreateHunts < ActiveRecord::Migration
  def change
    create_table :hunts, id: false do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.belongs_to :location, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :hunts, [:game_id, :location_id], unique: true
  end
end
