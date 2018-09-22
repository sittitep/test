require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "POST /api/registrations" do
    context "has all required params" do
      it "return 200 with token" do
        post registrations_path, params: {user: {email: "test@email.com", password: "password"}}

        result = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(result["token"]).to be_present
      end
    end
    context "some requried params are missing" do
      it "return 400 with error message" do
        post registrations_path, params: {user: {email: "test@email.com"}}

        result = JSON.parse(response.body)
        expect(response).to have_http_status(400)
        expect(result["message"]).to be_present
      end
    end
  end
end
