class SellAssetJob < ApplicationJob
  queue_as :default

  def perform(args)
    SellTransaction.process(args)
  end
end
