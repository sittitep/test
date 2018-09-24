class BuyTransaction < Transaction
  def self.process(txref:, user_id:, asset:, amount:)
    ActiveRecord::Base.transaction do
      user = User.find(user_id)
      transaction = Transaction.find_by(txref: txref)
      asset_balance = user.get_balance(asset)
      cash_balance = user.get_balance("cash")
      amount = amount.to_i
      total_amount = amount * 10

      if cash_balance.amount >= total_amount
        cash_balance.subtract(total_amount)
        asset_balance.add(amount)
        cash_balance.save
        asset_balance.save
        transaction.complete!
      else
        transaction.fail!
      end
    end
  end
end
