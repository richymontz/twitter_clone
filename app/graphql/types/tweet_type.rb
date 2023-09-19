# frozen_string_literal: true

module Types
  class TweetType < Types::BaseObject
    field :id, ID, null: false
    field :body, String
    field :user, Types::UserType, null: false
    field :date_time, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def user
      RecordLoader.for(User).load(object.user_id)
    end

    def date_time
      object.created_at.strftime("%d/%m/%Y, %H:%M:%S")
    end
  end
end
