class LeagueSearchController < ApplicationController
  def show
    @league = League.find_by(name: params[:q])
    redirect_to @league if @league
    flash[:notice] = "That league doesn't exist! Make sure the name is exact."
    redirect_to '/start'
  end
end
