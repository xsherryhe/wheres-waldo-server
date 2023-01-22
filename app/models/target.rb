class Target < ApplicationRecord
  belongs_to :image
  has_many :game_targets, dependent: :destroy
  validates :name, presence: true
  validates :file, presence: true
  validates :row, presence: true
  validates :column, presence: true
  validate :in_image

  def correct?(selection_row, selection_column)
    row == selection_row && column == selection_column
  end

  private

  def in_image
    errors.add(:row, 'must be in image') if row >= image.height
    errors.add(:column, 'must be in image') if column >= image.width
  end
end
