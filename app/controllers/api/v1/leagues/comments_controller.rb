class Api::V1::Leagues::CommentsController < ApplicationController
  def index
    render json: League.find(params[:id]).comments.all
  end

  def create
    League.find(params[:id]).comments.create(comment_params.merge({user: current_user}))
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end

end
