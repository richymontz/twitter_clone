require 'rails_helper'

RSpec.describe 'Mutation Register' do
  context 'When is resquested with correct params' do
    let(:user) { FactoryBot.build(:user) }
    let(:query_response) { execute(user) }

    it 'creates an user' do
      expect(query_response.dig("data", "register", "username")).to be_present
      expect(query_response.dig("data", "register", "token")).to be_present
    end
  end

  context 'When wrong praams' do
    let(:user) { FactoryBot.build(:user, :blank_password) }
    let(:query_response) { execute(user) }

    it 'gets register error' do
      expect(query_response.dig("errors")).to be_present
    end
  end
  
  def execute(user)
    TwitterCloneSchema.execute(query_register, variables: { 
      fullName: user.full_name,
      username: user.username,
      email: user.email,
      password: user.password,
    }) 
  end

  def query_register
    <<-GQL
          mutation Register(
            $fullName: String!,
            $username:  String!,
            $password:  String!,
            $email: String!
          ){
            register(
              input: {
                fullName: $fullName,
                username: $username,
                password: $password,
                email: $email,
              }
            ){
              username
              token
            }
          }
        
      GQL
  end
end