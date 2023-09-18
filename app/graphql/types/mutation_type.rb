module Types
  class MutationType < Types::BaseObject
    field :login, Types::UserType, mutation: Mutations::LoginUser
    field :register, Types::UserType, mutation: Mutations::RegisterUser
  end
end
