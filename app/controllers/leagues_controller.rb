class LeaguesController < ApplicationController
  def show
    @league = (League.find(params[:id]) if params[:id]) || current_user.leagues.first
    render :partial => "users/user_profile_navbar"
  end
end
