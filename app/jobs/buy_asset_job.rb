class BuyAssetJob < ApplicationJob
  queue_as :default

  def perform(args)
    BuyTransaction.process(args)
  end
end
