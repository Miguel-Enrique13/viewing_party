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
      flash[:danger] = @user.errors.full_messages.to_sentence
      redirect_to new_user_url
    end
  end

  def index
    @invitations = Party.invited_parties(@current_user.id)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end
