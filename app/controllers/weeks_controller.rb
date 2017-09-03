class WeeksController < ApplicationController
  def show
    @week = (Week.find(params[:id]) if params[:id]) || current_week
  end
end
