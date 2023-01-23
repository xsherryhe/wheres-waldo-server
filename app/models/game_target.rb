class GameTarget < ApplicationRecord
  belongs_to :game
  belongs_to :target

  enum :status, %i[hidden found]

  def square
    found? ? [target.row, target.column] : nil
  end

  def as_json(options = {})
    super({
      only: [],
      methods: %i[square],
      include: { target: { except: %i[row column] } }
    }.merge(options))
  end
end
