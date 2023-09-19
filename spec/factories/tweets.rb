FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.paragraph }

    trait :with_user do
      user { create(:user) }
    end

    trait :with_long_body do
      body { Faker::Lorem.characters(number: 1000) }
    end
  end
end
