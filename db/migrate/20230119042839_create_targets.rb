class CreateTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :targets do |t|
      t.string :name
      t.integer :row
      t.integer :column
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
