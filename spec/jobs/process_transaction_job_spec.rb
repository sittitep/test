require 'rails_helper'

RSpec.describe ProcessTransactionJob, type: :job do
  describe '#perform' do
    context 'with enough cash' do
      it 'deduct cash and add gold amount' do
        user = create(:user)
        create(:balance, asset: "cash", amount: 100, user: user)
        txref = Transaction.uuid
        ProcessTransactionJob.new.perform(txref: txref, user_id: user.id, asset: "gold", amount: 1, type: "BuyTransaction")
        transaction = Transaction.find_by(txref: txref)

        expect(user.get_balance("cash").amount).to eq(90)
        expect(user.get_balance("gold").amount).to eq(1)
        expect(transaction.type).to eq("BuyTransaction")
        expect(transaction.user_id).to eq(user.id)
        expect(transaction.amount).to eq(1)
        expect(transaction.status).to eq("completed")
      end
    end
  end
end
