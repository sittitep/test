class CashController < BaseController
  def top_up
    txref = Transaction.uuid
    ProcessTransactionJob.perform_later(txref: txref, user_id: current_user.id, amount: params[:amount], type: "TopUpTransaction")

    render status: 200, json: {txref: txref}

  end

  def withdraw
    txref = Transaction.uuid
    ProcessTransactionJob.perform_later(txref: txref, user_id: current_user.id, amount: params[:amount], type: "WithdrawTransaction")

    render status: 200, json: {txref: txref}
  end
end
