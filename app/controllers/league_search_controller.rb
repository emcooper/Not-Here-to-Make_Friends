class LeagueSearchController < ApplicationController
  def show
    @league = League.find_by(name: params[:q])
    redirect_to @league
  end
end
