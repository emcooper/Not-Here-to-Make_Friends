class Api::V1::Merchants::PointsController < ApplicationController
  def show
    render json: Contestant.find(params[:id]).all_weekly_points
  end
end
