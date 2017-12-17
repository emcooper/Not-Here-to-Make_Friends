class Admin::SeasonsController < Admin::BaseController
  def new

  end

  def index
    @seasons = Season.all
  end

  def show
    @season = Season.find(params[:id])
  end
end
