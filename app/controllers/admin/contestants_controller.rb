class Admin::ContestantsController < Admin::BaseController
  def create
    @contestant = Contestant.new(contestant_params)
    unless @contestant.save
      flash[:notice] = "Oops, there was a problem."
    end
    redirect_to admin_season_path(contestant_params[:season_id])
  end

  private

  def contestant_params
    params.require(:contestant).permit(:name, :headshot, :twitter_handle, :season_id, :occupation, :age, :hometown, :bio)
  end
end
