class GameTarget < ApplicationRecord
  belongs_to :game
  belongs_to :target

  enum :status, %i[hidden found]

  def square
    found? ? [target.row, target.column] : nil
  end
end
