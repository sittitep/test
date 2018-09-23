FactoryBot.define do
  factory :transaction do
    txref { "MyString" }
    type { "" }
    asset { "MyString" }
    amount { 1 }
    user { nil }
    status { "MyString" }
  end
end
