class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :title
      t.integer :duration
      t.date :starts_at_date
      t.time :starts_at_time
      t.belongs_to :organizer, references: :users, index: true

      t.timestamps null: false
    end
    add_foreign_key :games, :users, column: :organizer_id
  end
end
