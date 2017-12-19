class TeamsController < ApplicationController

  def create
    team = Team.create(name: params[:team][:team_name], league_id: params[:team][:league_id])
    team.team_members.create(user: current_user)
    flash[:notice] = "You've created team #{team.name}!"
    redirect_to team.league
  end

  def index
    @league = League.find(params[:league_id])
  end

  def destroy
    team = Team.find(params[:id])
    @league = team.league
    team.destroy
    redirect_to @league
  end
end
