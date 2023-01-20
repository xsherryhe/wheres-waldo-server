class ChangeCorrectTargetsDefaultOnGames < ActiveRecord::Migration[7.0]
  def change
    change_column_default :games, :correct_targets, 0
  end
end
