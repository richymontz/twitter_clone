class User < ApplicationRecord
  has_many :tweets
  has_many :following_me, class_name: 'Follow',foreign_key: 'to_user_id'  
  has_many :my_follows, class_name: 'Follow', foreign_key: 'from_user_id'  
  has_many :followers, class_name: 'User', through: :following_me
  has_many :followings, class_name: 'User', through: :my_follows

  attr_accessor :token

  scope :follow_ids, ->(user_id) {
    Follow.has_user_id(user_id).pluck(:from_user_id, :to_user_id).flatten.uniq
  }

  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :full_name, presence: true

  before_create :default_avatar

  def related_users
    ids = self.class.follow_ids(id)
    self.class.where("id IN (?)", ids).order(:full_name, :username)
  end

  def feed
    ids = self.class.follow_ids(id)
    Tweet.where("user_id in (?)", ids).order(created_at: :desc)
  end

  private

  def default_avatar
    self.avatar = Faker::Avatar.image
  end
end
