class SellAssetJob < ApplicationJob
  queue_as :default

  def perform(txref:, user_id:, asset:, amount:)
    ActiveRecord::Base.transaction do
      user = User.find(user_id)
      transaction = Transaction.find_by(txref: txref)
      asset_balance = user.get_balance(asset)
      cash_balance = user.get_balance("cash")
      amount = amount.to_i
      total_amount = amount * 10

      if asset_balance.amount >= amount
        cash_balance.add(total_amount)
        asset_balance.subtract(amount)
        cash_balance.save
        asset_balance.save
        transaction.complete!
      else
        transaction.fail!
      end
    end
  end
end
