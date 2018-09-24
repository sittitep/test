class SellTransaction < Transaction
  def process
    ActiveRecord::Base.transaction do
      asset_balance = user.get_balance(asset)
      cash_balance = user.get_balance("cash")
      total_amount = amount * 10

      if asset_balance.amount >= amount
        cash_balance.add(total_amount)
        asset_balance.subtract(amount)
        cash_balance.save
        asset_balance.save
        complete!
      else
        fail!
      end
    end
  end
end
