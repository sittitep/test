require 'rails_helper'

RSpec.describe Token, type: :model do
  describe '#get_uniqe_code' do
    it 'return uniqe code' do
      code = Token.get_uniqe_code
      expect(Token.where(code: code)).to be_blank
    end
  end

  describe '#set_expired_at' do
    it 'set expired_at before create' do
      code = Token.create(code: 1234, user: create(:user))

      expect(code.expired_at > Date.today).to be true
    end
  end
end
