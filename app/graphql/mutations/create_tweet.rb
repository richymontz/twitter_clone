module Mutations
  class CreateTweet < BaseMutation
    argument :body, String, required: false

    def ready?(**args)
      authenticate!
    end

    def resolve(body:)
      tweet = Tweet.create(body: body, user: current_user)
      if tweet
        tweet
      else
        raise GraphQL::ExecutionError.new(e.errors.full_messages)
      end
    end
  end
end
