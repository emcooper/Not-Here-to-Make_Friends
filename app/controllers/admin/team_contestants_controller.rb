class Admin::TeamContestantsController < Admin::BaseController
  def create
    TeamContestant.initiate_draft(current_season)
    redirect_to admin_draft_path
  end
end
