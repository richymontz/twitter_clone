FactoryBot.define do
  factory :follow do
    from_user_id { 1 }
    to_user_id { 1 }
  end
end
