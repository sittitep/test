require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /api/sessions" do
    before do
      create(:user, email: "test@email.com", password: "password")
    end

    context "email and password is correct" do
      it "return 200 with token" do
        post sessions_path, params: {email: "test@email.com", password: "password"}

        result = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(result["token"]).to be_present
      end
    end
    context "invalid email" do
      it "return 400 with error message" do
        post sessions_path, params: {email: "test@email.co", password: "password"}

        result = JSON.parse(response.body)
        expect(response).to have_http_status(400)
        expect(result["message"]).to be_present
      end
    end
    context "invalid password" do
      it "return 400 with error message" do
        post sessions_path, params: {email: "test@email.com", password: "1234"}

        result = JSON.parse(response.body)
        expect(response).to have_http_status(400)
        expect(result["message"]).to be_present
      end
    end
  end
end
