class User < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true, allow_nil: true

  has_secure_password
end
