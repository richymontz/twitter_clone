class User < ApplicationRecord
  has_many :tweets

  attr_accessor :token

  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :full_name, presence: true
end
