class Transaction < ApplicationRecord
  def initialize(args)
    super(args)
    self.txref ||= SecureRandom.uuid
  end

  belongs_to :user

  include AASM

  aasm column: :status do
    state :pending, :initial => true
    state :completed
    state :failed

    event :complete do
      transitions :from => :pending, :to => :completed
    end

    event :fail do
      transitions :from => :pending, :to => :failed
    end
  end
end
