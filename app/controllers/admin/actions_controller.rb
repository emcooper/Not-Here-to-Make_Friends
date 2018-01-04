class Admin::ActionsController < Admin::BaseController
  def create
    params[:weekly_actions][:plays].each do |play_id, play_count|
      if play_count[0].to_i > 0
        Action.create!(contestant_id: params[:weekly_actions][:contestant_id][0],
                      week_id: params[:weekly_actions][:week_id][0],
                      play_id: play_id,
                      count: play_count[0])
      end
    end
    redirect_to "/weeks/#{params[:weekly_actions][:week_id][0]}"
  end

end
