module Mutations
  class RegisterUser < BaseMutation
    argument :username, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :full_name, String, required: true

    def resolve(**attributes)
      user = User.new(attributes)

      if user.save
        user.token = user.to_sgid(expires_in: 12.hours, for: 'graphql')
        user
      else
        raise GraphQL::ExecutionError.new(user.errors.full_messages)
      end
    end
  end
end
