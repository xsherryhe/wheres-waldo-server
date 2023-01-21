class Game < ApplicationRecord
  belongs_to :image
  has_many :game_targets, dependent: :destroy

  def self.create(attrs)
    game = super(attrs)
    game.game_targets.create(game.image.targets.map { |target| { target_id: target.id } })
    game
  end

  def completed?
    game_targets.found.count == game_targets.count
  end

  def completion_time
    completed_at.present? ? (completed_at - created_at).round : nil
  end

  def as_json(_ = {})
    super({ only: %i[id], methods: :completion_time, include:
      [
        :image,
        { game_targets:
          {
            only: [],
            methods: %i[square],
            include: { target: { except: %i[row column] } }
          } }
      ] })
  end
end
