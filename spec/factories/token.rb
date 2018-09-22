FactoryBot.define do
  factory :token, class: Token do
    sequence(:code) { SecureRandom.uuid }

    transient do
      expired { false }
    end

    after(:create) do |token, evaluator|
      token.expired_at = 1.days.ago if evaluator.expired
      token.save
    end
  end
end
