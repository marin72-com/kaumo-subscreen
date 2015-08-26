class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to new_push_path, notice: 'click image'
    #redirect_to root_path || session.delete(:back_url), notice: 'successfully logged in'
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'successfully logged out'
  end
end
