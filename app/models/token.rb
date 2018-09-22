class Token < ApplicationRecord
  belongs_to :user

  before_create :set_expired_at

  scope :valid, -> { where("expired_at >= ?", Date.today) }

  def self.get_uniqe_code
    loop do
      code = SecureRandom.uuid
      break code unless Token.find_by(code: code)
    end
  end

  private

  def set_expired_at
    self.expired_at = 5.days.from_now
  end
end
