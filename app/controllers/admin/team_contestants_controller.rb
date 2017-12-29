class Admin::TeamContestantsController < Admin::BaseController
  def create
    TeamContestant.initiate_draft(current_season)
    redirect_to admin_season_path(current_season)
  end
end
