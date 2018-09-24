class BuyTransaction < Transaction
  def process
    ActiveRecord::Base.transaction do
      asset_balance = user.get_balance(asset)
      cash_balance = user.get_balance("cash")
      total_amount = amount * 10

      if cash_balance.amount >= total_amount
        cash_balance.subtract(total_amount)
        asset_balance.add(amount)
        cash_balance.save
        asset_balance.save
        complete!
      else
        fail!
      end
    end
  end
end
