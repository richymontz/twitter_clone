require 'rails_helper'

RSpec.describe 'Mutation Login' do
  context 'When is resquested with correct data' do
    let(:user) { FactoryBot.create(:user) }
    let(:query_response) do 
      TwitterCloneSchema.execute(query_login, variables: { 
        username: user.username, 
        password: user.password 
      }) 
    end

    it 'Authenticates an user' do
      expect(query_response.dig("data", "login", "token")).to be_present
    end
  end

  context 'When wrong username or password is given' do
    let(:query_response) do 
      TwitterCloneSchema.execute(query_login, variables: {
         email: "wronguser", 
         password: "foo bar" 
      }) 
    end
   
    it 'returns login error' do
      expect(query_response["data"]).to be_nil  
      expect(query_response["errors"]).to be_present
    end
  end
  
  def query_login
    <<-GQL
          mutation Login($username: String! $password: String! ){
            login(
              input: {
                username: $username
                password: $password
              }
            ){
              token
            }
          }
        
      GQL
  end
end