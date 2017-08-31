class Contestant < ApplicationRecord
  belongs_to :season
  has_many :team_contestants
  has_many :teams, through: :team_contestants
  has_many :weekly_contestants
  has_many :weeks, through: :weekly_contestants
  has_many :actions

  def season_points
    actions.joins(:play).sum("point_value * count")
  end

  def weekly_points(week)
    actions.joins(:play)
            .where(week: week)
            .sum("point_value * count")
  end
end
