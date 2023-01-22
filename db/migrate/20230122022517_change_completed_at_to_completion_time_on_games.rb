class ChangeCompletedAtToCompletionTimeOnGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :completed_at, :datetime
    add_column :games, :completion_time, :integer
  end
end
