require 'rails_helper'

RSpec.describe BuyTransaction, type: :model do
  let(:user) { create(:user) }
  let(:transaction) { create(:buy_transaction, user: user, asset: "gold", amount: 1)}

  describe "#process" do
    it "process a transaction" do
      create(:balance, asset: "cash", amount: 100, user: user)

      transaction.process
      
      expect(user.get_balance("cash").amount).to eq(90)
      expect(user.get_balance("gold").amount).to eq(1)
      expect(transaction.reload.status).to eq("completed")
    end
  end
end
        