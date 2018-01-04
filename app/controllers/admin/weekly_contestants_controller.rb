class Admin::WeeklyContestantsController < Admin::BaseController

  def create
    season = Season.find(params[:season_id])
    week = Week.find(params[:week_id])
    params[:contestant_ids].each do |id|
      contestant = Contestant.find(id)
      unless contestant.weeks.include?(week)
        contestant.weeks << week
      end
    end
  end

end
