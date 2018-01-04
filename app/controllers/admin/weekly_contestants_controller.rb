class Admin::WeeklyContestantsController < Admin::BaseController

  def create
    week = Week.find(params[:week_id])
    week.weekly_contestants.destroy_all #reset
    params[:contestant_ids].each do |id|
      contestant = Contestant.find(id)
        contestant.weeks << week
    end
    redirect_to week
  end

end
