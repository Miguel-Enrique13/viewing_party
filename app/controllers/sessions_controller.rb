class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:username])

    if user.nil? || !user.authenticate(params[:password])
      flash[:danger] = 'Incorrect Email or Password'
      redirect_to new_login_url
    else
      flash[:success] = 'You have successfully logged in!'
      session[:user_id] = user.id
      redirect_to users_url
    end
  end
end
