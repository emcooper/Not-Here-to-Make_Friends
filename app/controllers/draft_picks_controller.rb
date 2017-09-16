class DraftPicksController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
  end

  def create
    byebug
  end
end
