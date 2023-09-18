class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: 'from_user_id'
  belongs_to :following, class_name: 'User', foreign_key: 'to_user_id'

  scope :has_user_id, ->(user_id){ where("from_user_id = :user_id OR to_user_id = :user_id", user_id: user_id) }
end
