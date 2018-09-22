require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe '#get_token' do
    it 'return token code' do
      code = user.get_token
      expect(code).to be_present
      expect(user.tokens.find_by(code: code)).to be_present
    end
  end
end
