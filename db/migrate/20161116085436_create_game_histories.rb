class CreateGameHistories < ActiveRecord::Migration
  def change
    create_table :game_histories do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.belongs_to :location, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.boolean :discovered
      t.boolean :hint1_used
      t.boolean :hint2_used

      t.timestamps null: false
    end
    add_index :game_histories, [:game_id, :location_id, :user_id], unique: true
  end
end
