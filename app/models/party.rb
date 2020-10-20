class Party < ApplicationRecord
  validates :movie_id,  presence: true
  validates :movie_title, presence: true
  validates :date, presence: true
  validates :movie_runtime, presence: true
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: :movie_runtime }

  belongs_to :user
  has_many :invitations

  def invite(friends_id)
    friends_id.each do |id|
      Invitation.create!(party_id: self.id, user_id: id)
    end
  end
end
