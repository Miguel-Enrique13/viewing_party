module FriendshipsHelper
  def add_friend(friend)
    if friend && friend != @current_user && @current_user.friends.none? { |current_friend| current_friend == friend }
      Friendship.recipricate_friendship(@current_user.id, friend.id)
      flash[:success] = "#{friend.username} has been added to your friends!"
    else
      flash[:danger] = "#{friend.username} is already your friend!" if @current_user.friends.any? { |current_friend| current_friend == friend }
      flash[:danger] = 'User does not exist' if friend.nil?
      flash[:danger] = 'Cannot add yourself as a friend' if friend == @current_user
    end
  end
end
