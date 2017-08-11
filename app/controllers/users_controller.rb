class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Your account has been created!"
      redirect_to @user
    else
      @user.errors.full_messages.each do |error|
        flash[:notice] = error
      end
      redirect_to new_user_path
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
