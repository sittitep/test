require 'rails_helper'

RSpec.describe Balance, type: :model do
  let(:balance) { create(:balance, amount: 10, user: create(:user)) }

  describe "#add" do
    it "add amount to balance" do
      balance.add(10)
      expect(balance.amount).to eq(20)
    end
  end

  describe "#subtract" do
    it "subtract balance amount" do
      balance.subtract(10)
      expect(balance.amount).to eq(0)
    end
  end
end
