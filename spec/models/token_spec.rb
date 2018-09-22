require 'rails_helper'

RSpec.describe Token, type: :model do
  let(:user) { create(:user) }

  describe '#valid' do
    it 'return valid token' do
      valid_token = create(:token, user: user)
      invalid_token = create(:token, user: user, expired: true)

      expect(Token.valid.count).to eq(1)
    end
  end

  describe '#get_uniqe_code' do
    it 'return uniqe code' do
      code = Token.get_uniqe_code
      expect(Token.where(code: code)).to be_blank
    end
  end

  describe '#set_expired_at' do
    it 'set expired_at before create' do
      code = create(:token, user: user)

      expect(code.expired_at > Date.today).to be true
    end
  end
end
