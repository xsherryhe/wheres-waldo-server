class Game < ApplicationRecord
  belongs_to :image

  def completion_time
    (completed_at - created_at).round
  end
end
