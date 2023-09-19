module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField


    field :me, Types::UserType, null: false,
      description: "Contextual details of the authentication"
    def me
      authenticate!
      current_user
    end

    field :user_info, Types::UserType, null: false do
      argument :username, String, required: true
    end

    def user_info(username:)
      User.find_by(username: username)
    end
  end
end
