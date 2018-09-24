class ProcessTransactionJob < ApplicationJob
  queue_as :default

  def perform(args)
    transaction = Transaction.new(args)
    transaction.save!
    transaction.process
  end
end
