class Api::V1::Leagues::TeamPointsController < ApplicationController
  def index
    render json: League.find(params[:id]).team_points
  end
end
