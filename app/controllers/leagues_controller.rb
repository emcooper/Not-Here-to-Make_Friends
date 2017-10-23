class LeaguesController < ApplicationController
  def show
    @league = (League.find(params[:id]) if params[:id]) || current_user.leagues.first
    @comment = Comment.new(league: @league)
  end

  def create
    @league = League.create!(league_params)
    current_user.teams.create!(name: params[:league][:team], league: @league)
    redirect_to @league
  end

  private

  def league_params
    name = params.require(:league).permit(:name)
    name.merge(season_id: current_season.id)
  end
end
