require 'rails_helper'

RSpec.describe SellTransaction, type: :model do
  let(:user) { create(:user) }
  let(:transaction) { create(:sell_transaction, user: user, asset: "gold", amount: 1)}

  describe "#process" do
    it "process a transaction" do
      create(:balance, asset: "gold", amount: 1, user: user)

      transaction.process
      
      expect(user.get_balance("cash").amount).to eq(10)
      expect(user.get_balance("gold").amount).to eq(0)
      expect(transaction.reload.status).to eq("completed")
    end
  end
end
