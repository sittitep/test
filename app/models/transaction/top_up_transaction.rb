class TopUpTransaction < Transaction
  def process
    cash_balance = user.get_balance("cash")

    cash_balance.add(amount)
    cash_balance.save
    complete!
  end
end
