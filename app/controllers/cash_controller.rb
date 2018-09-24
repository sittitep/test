class CashController < BaseController
  def top_up
    transaction = TopUpTransaction.create(user_id: current_user.id, amount: params[:amount])

    render status: 200, json: {txref: transaction.txref}

  end

  def withdraw
    transaction = WithdrawTransaction.create(user_id: current_user.id, amount: params[:amount])

    render status: 200, json: {txref: transaction.txref}
  end
end
