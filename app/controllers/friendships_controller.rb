class FriendshipsController < ApplicationController
  before_action :require_user
  def create
    @friend = User.find_by(email: params[:email])
    if @friend
      Friendship.recipricate_friendship(current_user.id, @friend.id)
      flash[:success] = "#{@friend.username} has been added to your friends!"
    else
      flash[:error] = 'User does not exist'
    end
    redirect_to users_url
  end
end
