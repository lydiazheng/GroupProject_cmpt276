class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays, id: false do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :points
      t.integer :finish_time
      t.integer :rank

      t.timestamps null: false
    end
    add_index :plays, [:game_id, :user_id], unique: true
  end
end
