class AssetsController < BaseController
  def buy
    txref = Transaction.uuid
    ProcessTransactionJob.perform_later(txref: txref, user_id: current_user.id, asset: params[:asset_name], amount: params[:amount], type: "BuyTransaction")

    render status: 200, json: {txref: txref}
  end

  def sell
    txref = Transaction.uuid
    ProcessTransactionJob.perform_later(txref: txref, user_id: current_user.id, asset: params[:asset_name], amount: params[:amount], type: "SellTransaction")

    render status: 200, json: {txref: txref}
  end
end
