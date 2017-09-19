class Api::V1::Leagues::CommentsController < ApplicationController
  def index
    comments = League.find(params[:id]).comments
    comments_with_user_names = comments.map {|comment| {message: comment.message, user: User.find(comment.user_id).name, date: comment.created_at.to_formatted_s(:long_ordinal)}}
    render json: comments_with_user_names
  end

  def create
    League.find(params[:id]).comments.create(comment_params.merge({user: current_user}))
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end

end
