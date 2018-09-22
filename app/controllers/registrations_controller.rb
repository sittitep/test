class RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)
    user.save!

    render status: 200, json: {token: user.get_token}
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  rescue_from 'ActiveRecord::RecordInvalid' do |e|
    render status: 400, json: {message: e.message}
  end
end
