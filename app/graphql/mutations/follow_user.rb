module Mutations
  class FollowUser < BaseMutation
    argument :from_id, Integer, required: true
    argument :to_id, Integer, required: true

    def resolve(from_id:, to_id:)
      follow = Follow.new(from_user_id: from_id, to_user_id: to_id)
  
      if follow.save
        follow
      else
        raise GraphQL::ExecutionError.new(follow.errors.full_messages)
      end
    end
  end
end
