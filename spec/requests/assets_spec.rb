require 'rails_helper'

RSpec.describe "Assets", type: :request do
  let(:user) { create(:user) }

  describe "POST /api/asset/:asset_name/buy" do
    it "return transaction txref" do
      create(:balance, asset: "cash", amount: 100, user: user)

      post buy_asset_path(asset_name: "gold"), headers: {"TOKEN" => user.valid_token.code}, params: {amount: 1}

      result = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(result["txref"]).to be_present
    end
  end

  describe "POST /api/asset/:asset_name/sell" do
    it "return transaction txref" do
      create(:balance, asset: "gold", amount: 100, user: user)

      post sell_asset_path(asset_name: "gold"), headers: {"TOKEN" => user.valid_token.code}, params: {amount: 1}

      result = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(result["txref"]).to be_present
    end
  end
end
