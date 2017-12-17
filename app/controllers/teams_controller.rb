class TeamsController < ApplicationController

  def create
    team = Team.create(name: params[:team][:team_name], league_id: params[:team][:league_id])
    team.team_members.create(user: current_user)
    flash[:notice] = "You've created team #{team.name}!"
    redirect_to team.league
  end
end
