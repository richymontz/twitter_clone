FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.paragraph }
    user { create(:user) }
  end
end
