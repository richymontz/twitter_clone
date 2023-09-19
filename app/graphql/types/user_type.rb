# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :username, String
    field :email, String
    field :full_name, String
    field :token, String
    field :avatar, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :follower_ids, [Integer], null: false
    field :following_ids, [Integer], null: false
    field :related_users, [UserType], null: false
    field :tweets, [Types::TweetType]

    def follower_ids
      object.follower_ids
    end

    def following_ids
      object.following_ids
    end

    def related_users
      object.related_users
    end

    def tweets
      AssociationLoader.for(object.class, :tweets).load(object).then do |record|
        record
      end
    end
  end
end
