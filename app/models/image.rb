class Image < ApplicationRecord
  has_many :targets, dependent: :destroy
  has_many :games, dependent: :destroy
  validates :name, presence: true
  validates :file, presence: true
  validates :width, presence: true
  validates :height, presence: true

  def ranked_games
    games.completed.ranked
  end

  def update_rankings
    ranked_games[10..].each(&:destroy)
  end
end
