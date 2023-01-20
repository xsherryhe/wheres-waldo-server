class Image < ApplicationRecord
  has_many :targets, dependent: :destroy
  has_many :games, dependent: :destroy
  validates :file, presence: true
  validates :width, presence: true
  validates :height, presence: true
end
