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

  def weekly_actions(week)
    actions.where(week: week)
  end

  def all_weekly_points
    Week.select("weeks.week_number, sum(point_value * count) AS points")
        .joins(actions: :play)
        .where("contestant_id = ?", id)
        .group("weeks.id")
        .order("weeks.week_number")
  end
end
