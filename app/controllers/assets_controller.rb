class AssetsController < BaseController
  def buy
    transaction = BuyTransaction.create(user: current_user, asset: params[:asset_name], amount: params[:amount])
    BuyAssetJob.perform_later(txref: transaction.txref, user_id: current_user.id, asset: params[:asset_name], amount: params[:amount])

    render status: 200, json: {txref: transaction.txref}
  end
end
