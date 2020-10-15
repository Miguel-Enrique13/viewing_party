class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def self.recipricate_friendship(user_id, friend_id)
    Friendship.create(user_id: user_id, friend_id: friend_id)
    Friendship.create(user_id: friend_id, friend_id: user_id)
  end
end
