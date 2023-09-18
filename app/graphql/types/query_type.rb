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
      argument :user_id, Integer, required: true
    end

    def user_info(user_id:)
      User.find_by(id: user_id)
    end
  end
end
