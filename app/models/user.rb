class User < ApplicationRecord
  has_secure_password

  has_many :tokens

  def self.authenticate(email, password)
    user = find_by(email: email).try(:authenticate, password)
    if user.present?
      user
    else
      raise AuthenticationError.new("Invalid email or password")
    end
  end

  def valid_token
    tokens.valid.last || get_token    
  end

  def get_token
    Token.create(code: Token.get_uniqe_code, user: self)
  end
end

class AuthenticationError < StandardError; end;
