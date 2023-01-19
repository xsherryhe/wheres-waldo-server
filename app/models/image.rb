class Image < ApplicationRecord
  has_many :targets, dependent: :destroy
  validates :file, presence: true
  validates :width, presence: true
  validates :height, presence: true
end
