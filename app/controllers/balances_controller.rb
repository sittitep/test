class BalancesController < BaseController
  def index
    response = {}
    current_user.balances.pluck(:asset, :amount).each do |k,v|
      response[k] = v
    end
    render status: 200, json: response
  end
end
