require 'rails_helper'

RSpec.describe "Cashes", type: :request do
  let(:user) { create(:user) }

  describe "POST /cash/top_up" do
    it "return transaction txref" do
      create(:balance, asset: "cash", amount: 100, user: user)

      post cash_top_up_path, headers: {"TOKEN" => user.valid_token.code}, params: {amount: 100}

      result = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(result["txref"]).to be_present
    end
  end

  describe "POST /cash/withdraw" do
    it "return transaction txref" do
      create(:balance, asset: "cash", amount: 100, user: user)

      post cash_withdraw_path, headers: {"TOKEN" => user.valid_token.code}, params: {amount: 100}

      result = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(result["txref"]).to be_present
    end
  end
end


