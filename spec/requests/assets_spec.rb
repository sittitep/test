require 'rails_helper'

RSpec.describe "Balances", type: :request do
  describe "GET /api/balance" do
    it "return balances" do
      user = create(:user)
      create(:balance, asset: "cash", amount: 100, user: user)

      post buy_asset_path(asset_name: "gold"), headers: {"TOKEN" => user.valid_token.code}, params: {amount: 1}

      result = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(result["txref"]).to be_present
    end
  end
end
