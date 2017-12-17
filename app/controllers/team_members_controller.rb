class TeamMembersController < ApplicationController
  def create
    team = Team.find(params[:team_id])
    TeamMember.create(team_id: team.id, user_id: params[:user_id])
    flash[:notice] = "You've joined team #{team.name}!"
    redirect_to team.league
  end
end
