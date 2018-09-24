class BuyAssetJob < ApplicationJob
  queue_as :default

  def perform(args)
    BuyTransaction.find_by(txref: args[:txref]).process
  end
end
