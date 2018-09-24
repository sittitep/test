require 'rails_helper'

RSpec.describe TopUpTransaction, type: :model do
  let(:user) { create(:user) }
  let(:transaction) { create(:top_up_transaction, user: user, asset: "cash", amount: 100)}

  describe "#process" do
    it "process a transaction" do
      transaction.process
      expect(user.get_balance("cash").amount).to eq(100)
    end
  end
end
