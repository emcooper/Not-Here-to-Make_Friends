class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_with_omniauth(auth)
    if @identity == nil
      @identity = Identity.create_with_omniauth(auth)
    end
    if @identity.user.present?
      session[:user_id] = @identity.user.id
      redirect_to @identity.user
    else
      User.create_with_omniauth(auth, @identity)
      session[:user_id] = @identity.user.id
      redirect_to @identity.user
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
