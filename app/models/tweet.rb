class Tweet < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates :body, length: { 
    maximum: 280,
    too_long: "%{count} characters is the maximum allowed" 
  }
end
