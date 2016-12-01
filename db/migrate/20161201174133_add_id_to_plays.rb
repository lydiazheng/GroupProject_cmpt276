class AddIdToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :id, :primary_key
  end
end
