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
  end
end
