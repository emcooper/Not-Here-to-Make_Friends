class DraftPicksController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
  end

  def update
    team = Team.find(params[:team_id].to_i)
    params[:order].each do |k, v|
      draft_pick = team.draft_picks.find_by(contestant_id: v[:id])
      draft_pick.update(rank: v[:position])
    end
  end
end
