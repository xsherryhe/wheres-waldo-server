class AddFileToTargets < ActiveRecord::Migration[7.0]
  def change
    add_column :targets, :file, :string
  end
end
