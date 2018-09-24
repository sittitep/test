class Balance < ApplicationRecord
  belongs_to :user

  def add(amount)
    self.amount += amount
  end

  def subtract(amount)
    self.amount -= amount
  end
end
