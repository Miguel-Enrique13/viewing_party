class FriendshipsController < ApplicationController
  before_action :require_user
  include FriendshipsHelper

  def create
    @friend = User.find_by(email: params[:email])
    add_friend(@friend)
    redirect_to users_url
  end
end
