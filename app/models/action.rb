class Action < ApplicationRecord
  belongs_to :contestant
  belongs_to :play
  belongs_to :week

  def points
    play.point_value * count
  end
end
