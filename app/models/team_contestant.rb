class TeamContestant < ApplicationRecord
  belongs_to :contestant
  belongs_to :team

  def self.initiate_draft(season)
    season.leagues.each do |league|
      taken = []
      until taken.count == season.contestants.count do
        league.teams.each do |team|
            team.draft_picks.order(:rank).each do |pick|
              if !taken.include?(pick.contestant)
                team.contestants << pick.contestant
                taken << pick.contestant
                break
              end
            end
          end
      end
    end
  end

end
