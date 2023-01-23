class Game < ApplicationRecord
  belongs_to :image
  has_many :game_targets, dependent: :destroy

  scope :completed, -> { where.not(completion_time: nil) }
  scope :ranked, -> { order(completion_time: :asc, updated_at: :asc) }

  def self.create(attrs)
    game = super(attrs)
    game.game_targets.create(game.image.targets.map { |target| { target_id: target.id } })
    game
  end

  def find_target!(target)
    game_targets.find_by(target:).found!
  end

  def just_completed?
    !completed? && game_targets.found.count == game_targets.count
  end

  def completed?
    completion_time.present?
  end

  def completed!
    update(completion_time: (current_time_from_proper_timezone - created_at).round) unless completed?
  end

  def targets
    game_targets.order(:id)
  end

  def as_json(options = {})
    data = super({ only: %i[id player completion_time] }.merge(options))
    target = options[:target]
    data.merge(target ? { target: game_targets.find_by(target:).as_json } : {})
  end
end
