class Admin::SeasonsController < Admin::BaseController
  def new

  end

  def index
    @seasons = Season.all
  end
end
