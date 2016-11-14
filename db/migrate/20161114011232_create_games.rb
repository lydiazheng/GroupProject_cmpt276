class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.integer :duration
      t.datetime :gdatetime
      t.integer :organizer_id

      t.timestamps null: false
    end
  end
end
