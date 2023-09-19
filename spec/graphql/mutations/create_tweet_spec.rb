require 'rails_helper'

RSpec.describe 'Mutation Create Tweet' do
  context 'when is requested with correct params' do
    let(:tweet) { FactoryBot.build(:tweet) }
    let(:current_user) { FactoryBot.create(:user) }
    let(:query_response) { execute(tweet, current_user) }

    it 'creates a tweet' do
      expect(query_response.dig("data", "createTweet", "body")).to be_present
      expect(query_response.dig("data", "createTweet", "user", "username")).to be_present
    end
  end

  context 'When wrong body length' do
    let(:tweet) { FactoryBot.build(:tweet, :with_long_body) }
    let(:current_user) { FactoryBot.create(:user) }
    let(:query_response) { execute(tweet, current_user) }

    it 'returns tweet validation error' do
      p query_response
      expect(query_response.dig("errors")).to be_present
    end
  end

  def execute(tweet, current_user)
    TwitterCloneSchema.execute(
      query, 
      context: { current_user: current_user },
      variables: { 
        body: tweet.body
      }
    ) 
  end

  def query
    <<-GQL
          mutation createTweet(
            $body: String!
          ){
            createTweet(
              input: {
                body: $body,
              }
            ){
              body
              user{
                username
              }
            }
          }
        
      GQL
  end
end