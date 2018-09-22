require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe '#get_token' do
    it 'return token' do
      token = user.get_token
      expect(token).to be_present
      expect(user.tokens.find_by(code: token.code)).to be_present
    end
  end

  describe '#valid_token' do
    context 'last token is still valid' do
      it 'return valid token' do
        token = create(:token, user: user)
        expect(user.valid_token).to eq(token)
      end
    end
    context 'last token is expired' do
      it 'return valid token' do
        token = create(:token, user: user, expired: true)

        expect(user.valid_token).to_not eq(token)
        expect(user.tokens.count).to eq(2)
      end
    end
  end
end
