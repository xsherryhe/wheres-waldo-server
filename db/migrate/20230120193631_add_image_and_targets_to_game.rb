class AddImageAndTargetsToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :correct_targets, :integer
    add_reference :games, :image, null: false, foreign_key: true
  end
end
