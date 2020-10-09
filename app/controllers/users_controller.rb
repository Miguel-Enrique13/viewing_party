class UsersController < ApplicationController
  before_action :require_user, only: :index

  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'You have been registered and are now logged in!'
      session[:user_id] = @user.id
      redirect_to users_url
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to new_user_url
    end
  end

  def index; end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

  def require_user
    render file: '/public/404' if current_user.nil?
  end
end
