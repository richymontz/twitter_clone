require 'rails_helper'

RSpec.describe 'Query Me' do
  context 'when user is athenticated' do
    let(:user) { FactoryBot.create(:user) }
    let(:query_response) do
      TwitterCloneSchema.execute(query, context: { current_user: user })
    end

    it 'returns user info' do
     expect(query_response.dig("data", "me", "username")).to eq(user.username.to_s)
     expect(query_response.dig("data", "me", "fullName")).to eq(user.full_name)
    end
  end


  def query
    <<-GQL
      query Me{
        me{
          username
          fullName
        }
      }
    GQL
  end
end