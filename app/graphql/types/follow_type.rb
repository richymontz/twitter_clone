# frozen_string_literal: true

module Types
  class FollowType < Types::BaseObject
    field :from_user_id, Integer
    field :to_user_id, Integer
  end
end
