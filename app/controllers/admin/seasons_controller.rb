class Admin::SeasonsController < Admin::BaseController
  def index
    @seasons = Season.all
  end

  def show
    @season = Season.find(params[:id])
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      redirect_to admin_season_path(@season)
    else
      flash[:notice] = "Oops, there was a problem."
    end
  end

  def update
    season = Season.find(params[:id])
    new_status = season.status == "active" ? "retired" : "active"
    season.update(status: new_status)
    redirect_to admin_seasons_path
  end

  private

  def season_params
    params.require(:season).permit(:first_name, :last_name, :season_number, :season_type, :headshot, :draft_date)
  end
end
