 class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :username, uniqueness: true, presence: true, case_sensitive: false
  validates :email, uniqueness: true, presence: true, case_sensitive: false
  validates :password, presence: true, confirmation: true, allow_nil: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :parties
  has_many :invitations

  has_secure_password
end
