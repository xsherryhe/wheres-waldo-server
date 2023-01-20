class RemoveCorrectTargetsFromGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :correct_targets, :integer, default: 0
  end
end
