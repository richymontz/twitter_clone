module Mutations
  class UnfollowUser < BaseMutation
    argument :to_id, Integer, required: true
    
    def ready?(**args)
      authenticate!
    end

    def resolve(to_id:)
      follow = Follow.find_by(from_user_id: current_user.id, to_user_id: to_id)
  
      if follow.delete
        follow
      else
        raise GraphQL::ExecutionError.new(follow.errors.full_messages)
      end
    end
  end
end
