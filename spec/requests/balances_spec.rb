require 'rails_helper'

RSpec.describe "Balances", type: :request do
  describe "GET /api/balance" do
    it "return balances" do
      user = create(:user)
      create(:balance, asset: "gold", amount: 0, user: user)
      create(:balance, asset: "cash", amount: 0, user: user)

      get balance_path, headers: {"TOKEN" => user.valid_token.code}

      result = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(result["gold"]).to eq(0)
      expect(result["cash"]).to eq(0)
    end
  end
end
