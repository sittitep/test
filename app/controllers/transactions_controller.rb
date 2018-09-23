class TransactionsController < BaseController
  def index
    transactions = current_user.transactions.order("ID DESC")
    result = {}
    result[:transactions] = transactions.map { |tr| {txref: tr.txref, type: tr.type, asset: tr.asset, amount: tr.amount} }
    
    render status: 200, json: result
  end
end
