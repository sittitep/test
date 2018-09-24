require 'rails_helper'

RSpec.describe WithdrawTransaction, type: :model do
  let(:user) { create(:user) }
  let(:transaction) { create(:withdraw_transaction, user: user, asset: "cash", amount: 100)}

  describe "#process" do
    it "process a transaction" do
      create(:balance, asset: "cash", amount: 100, user: user)

      transaction.process
      expect(user.get_balance("cash").amount).to eq(0)
    end
  end
end
