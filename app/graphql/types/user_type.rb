# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :username, String
    field :email, String
    field :full_name, String
    field :token, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
