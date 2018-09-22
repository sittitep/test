FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "user#{n}@test.com" }
    password { 'password' }
  end
end
