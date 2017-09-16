class DraftPicksController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
  end
end
