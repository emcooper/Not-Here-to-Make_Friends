class Admin::TeamContestantsController < Admin::BaseController
  def create
    TeamContestant.draft
    redirect_to admin_dashboard_path
  end
end
