class Game < ApplicationRecord
  belongs_to :image
  has_many :game_targets, dependent: :destroy

  scope :completed, -> { where.not(completion_time: nil) }

  def self.create(attrs)
    game = super(attrs)
    game.game_targets.create(game.image.targets.map { |target| { target_id: target.id } })
    game
  end

  def completed_by_targets?
    game_targets.found.count == game_targets.count
  end

  def completed?
    completion_time.present?
  end

  def completed!
    update(completion_time: (current_time_from_proper_timezone - created_at).round) unless completed?
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
