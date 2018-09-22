class User < ApplicationRecord
  has_secure_password

  has_many :tokens

  def get_token
    token = Token.create(code: Token.get_uniqe_code, user: self)
    token.code
  end
end
