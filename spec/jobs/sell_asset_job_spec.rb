require 'rails_helper'

RSpec.describe SellAssetJob, type: :job do
  describe '#perform' do
    context 'with enough cash' do
      it 'deduct cash and add gold amount' do
        user = create(:user)
        create(:balance, asset: "gold", amount: 10, user: user)
        transaction = BuyTransaction.create(user: user)
        SellAssetJob.new.perform(txref: transaction.txref, user_id: user.id, asset: "gold", amount: 5)

        expect(user.get_balance("cash").amount).to eq(50)
        expect(user.get_balance("gold").amount).to eq(5)
        expect(transaction.reload.status).to eq("completed")
      end
    end
  end
end
