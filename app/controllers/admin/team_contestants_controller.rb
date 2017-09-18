class Admin::TeamContestantsController < Admin::BaseController
  def create
    TeamContestant.initiate_draft(current_season)
    redirect_to admin_control_room_path
  end
end
