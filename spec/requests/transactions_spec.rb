require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  describe "GET /transactions" do
    it "works! (now write some real specs)" do
      user = create(:user)
      BuyTransaction.create(user: user, asset: "gold", amount: 1)
      get transactions_path, headers: {"TOKEN" => user.valid_token.code}

      result = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(result["transactions"]).to be_present
    end
  end
end
