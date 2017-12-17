class Admin::WeeksController < Admin::BaseController
  def create
    @week = Week.new(week_params)
    unless @week.save
      flash[:notice] = "Oops, there was a problem."
    end
    redirect_to admin_season_path(week_params[:season_id])
  end

  private

  def week_params
    params.require(:week).permit(:date, :week_number, :season_id)
  end
end
