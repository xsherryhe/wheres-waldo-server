class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :file
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
