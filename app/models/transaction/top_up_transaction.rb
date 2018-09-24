class TopUpTransaction < Transaction
  def initialize(args)
    super(args)
    self.asset = "cash"
  end

  def process
    cash_balance = user.get_balance("cash")

    cash_balance.add(amount)
    cash_balance.save
    complete!
  end
end
