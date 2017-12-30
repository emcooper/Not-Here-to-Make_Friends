class League < ApplicationRecord
  belongs_to :season
  has_many :teams, dependent: :destroy
  has_many :comments, dependent: :destroy

  def team_of_user(user)
    teams.select("teams.*")
          .joins(:team_members)
          .find_by("team_members.user_id = ?", user.id)
  end

  def owner_of(contestant)
    teams.joins(:contestants).find_by("contestants.id = ?", contestant.id)
  end

  def team_points
    teams.map do |team|
      points = []
      10.times do |n|
        week = season.weeks.find_by(week_number: n+1)
        points << ((team.week_points(week) if week) || 0)
      end
      {name: team.name, points: points}
    end
  end
end
