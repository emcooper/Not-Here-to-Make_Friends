class Team < ApplicationRecord
  belongs_to :league
  has_many :team_members
  has_many :users, through: :team_members
  has_many :team_contestants
  has_many :contestants, through: :team_contestants
  has_many :draft_picks

  after_create :set_draft_picks

  def season_points
    contestants.joins(actions: :play).sum("point_value * count")
  end

  def set_draft_picks
    league.season.contestants.each_with_index do |contestant, i|
      DraftPick.create(contestant: contestant,
                      team: self,
                      rank: i + 1
                      )
    end
  end
end
