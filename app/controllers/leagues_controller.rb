class LeaguesController < ApplicationController
  def show
    @league = (League.find(params[:id]) if params[:id]) || current_user.leagues.first
    @comment = Comment.new(league: @league)
  end

  def create
    @league = League.create!(league_params)
    @team = current_user.teams.create!(name: params[:league][:team], league: @league)
    flash[:notice] = "You've created league #{@league.name} and team #{@team.name}!"
    redirect_to @league
  end

  private

  def league_params
    name = params.require(:league).permit(:name)
    name[:name].strip!
    name.merge(season_id: current_season.id)
  end
end
