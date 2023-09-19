module Mutations
  class CreateTweet < BaseMutation
    argument :body, String, required: false

    def ready?(**args)
      authenticate!
    end

    def resolve(body:)
      tweet = Tweet.new(body: body, user: current_user)
      if tweet.save
        tweet
      else
        raise GraphQL::ExecutionError.new(tweet.errors.full_messages)
      end
    end
  end
end
