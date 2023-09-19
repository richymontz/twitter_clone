FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password {  Faker::Internet.password }
    full_name { Faker::Name.name } 

    trait :blank_password do
      password { nil }
    end
  end
end
