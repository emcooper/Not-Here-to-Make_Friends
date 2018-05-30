class LeagueSearchController < ApplicationController
  def show
    @league = League.find_by(name: params[:q], season: current_season)
    if @league
      redirect_to @league
    else
      flash[:notice] = "That league doesn't exist! Make sure the name is exact."
      redirect_to '/start'
    end
  end
end
