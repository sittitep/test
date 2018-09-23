class User < ApplicationRecord
  has_secure_password

  has_many :tokens
  has_many :balances
  has_many :transactions

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

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

  def get_balance(asset)
    balances.find_or_initialize_by(asset: asset)
  end
end

class AuthenticationError < StandardError; end;
