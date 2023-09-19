module Types
  class MutationType < Types::BaseObject
    #Follow mutation
    field :follow_user, Types::FollowType, mutation: Mutations::FollowUser

    #Tweets mutations
    field :create_tweet, Types::TweetType ,mutation: Mutations::CreateTweet

    #User mutations
    field :login, Types::UserType, mutation: Mutations::LoginUser
    field :register, Types::UserType, mutation: Mutations::RegisterUser
  end
end
