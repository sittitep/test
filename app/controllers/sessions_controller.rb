class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:email], params[:password])

    render status: 200, json: {token: user.valid_token}
  end

  rescue_from "AuthenticationError" do |e|
    render status: 400, json: {message: e.message}
  end
end
