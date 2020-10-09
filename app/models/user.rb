class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true, allow_nil: true

  has_secure_password
end
