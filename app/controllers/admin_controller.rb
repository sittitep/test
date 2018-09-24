class AdminController < ActionController::Base
  http_basic_authenticate_with name: "admin", password: "password"

  def index
    @transactions = Transaction.where(type: ["TopUpTransaction","WithdrawTransaction"]).pending.order("created_at DESC")
  end

  def approve
    transaction = Transaction.find(params[:transaction_id])
    transaction.process

    redirect_to dashboard_path
  end

  def reject
    transaction = Transaction.find(params[:transaction_id])
    transaction.reject!

    redirect_to dashboard_path
  end
end
