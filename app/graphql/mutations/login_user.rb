module Mutations
  class LoginUser < BaseMutation
    argument :username, String, required: true
    argument :password, String, required: true

    def resolve(username:, password:)
      user = User.find_by(username: username)
      if user&.authenticate(password)
        #Assign a global ID
        user.token = user.to_sgid(expires_in: 12.hours, for: 'graphql')
        user
      else
        raise GraphQL::ExecutionError.new('Invalid username or password')
      end
    end
  end
end
