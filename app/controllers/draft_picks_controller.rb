class DraftPicksController < ApplicationController
  def edit
    @team = Team.find(params[:team_id])
  end

  def create

  end
end
