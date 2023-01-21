class CreateGameTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :game_targets do |t|
      t.references :game, null: false, foreign_key: true
      t.references :target, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
