class WithdrawTransaction < Transaction
  def process
    cash_balance = user.get_balance("cash")

    if cash_balance.amount >= amount
      cash_balance.subtract(amount)
      cash_balance.save
      complete!
    else
      fail!
    end
  end
end
