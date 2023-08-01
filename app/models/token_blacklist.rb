# app/models/token_blacklist.rb
class TokenBlacklist < ApplicationRecord
  validates :jwt_token, presence: true
  validates :expiring_at, presence: true

  # Scope to find blacklisted tokens that are not expired
  scope :valid_tokens, -> { where('expiring_at >= ?', Time.now) }
end

