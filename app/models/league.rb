class League < ApplicationRecord
  belongs_to :season
  has_many :teams

  def team_of_user(user)
    teams.select("teams.*")
          .joins(:team_members)
          .find_by("team_members.user_id = ?", user.id)
  end
end
