class SellAssetJob < ApplicationJob
  queue_as :default

  def perform(args)
    SellTransaction.find_by(txref: args[:txref]).process
  end
end
