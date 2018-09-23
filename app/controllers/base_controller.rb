class BaseController < ApplicationController
  before_action :authenticate

  def current_user
    @current_user ||= Token.valid.find_by(code: request.headers["TOKEN"]).try(:user)
  end

  def authenticate
    raise Unauthorized.new("Please verify your token") unless current_user
  end

  rescue_from "Unauthorized" do |e|
    render status: 401, json: {message: e.message}
  end
end

class Unauthorized < StandardError; end
