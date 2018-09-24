FactoryBot.define do
  factory :transaction do
  end
  factory :buy_transaction, class: "BuyTransaction" do
  end
  factory :sell_transaction, class: "SellTransaction" do
  end
  factory :top_up_transaction, class: "TopUpTransaction" do
  end
  factory :withdraw_transaction, class: "WithdrawTransaction" do
  end
end
