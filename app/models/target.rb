class Target < ApplicationRecord
  belongs_to :image
  validates :name, presence: true
  validates :file, presence: true
  validates :row, presence: true
  validates :column, presence: true
  validate :in_image

  private

  def in_image
    errors.add(:row, 'must be in image') if row >= image.height
    errors.add(:column, 'must be in image') if column >= image.width
  end
end
