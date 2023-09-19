FactoryBot.define do
  factory :follow do
    from_user_id { create(:user).id }
    to_user_id { create(:user).id }
  end
end
