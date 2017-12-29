class Admin::WeeklyContestantsController < Admin::BaseController

  def create
    season = Season.find(params[:season_id])
    first_week = season.weeks.find_by(week_number: 1)
    season.contestants.all.each do |contestant|
      unless contestant.weeks.include?(first_week)
        contestant.weeks << first_week
      end
    end
  end

end
