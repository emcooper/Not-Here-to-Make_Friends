class LeaguesController < ApplicationController
  def show
    @league = (League.find(params[:id]) if params[:id]) || current_user.leagues.first
  end
end
