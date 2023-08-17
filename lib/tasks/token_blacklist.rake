# frozen_string_literal: true

# lib/tasks/token_blacklist.rake
namespace :token_blacklist do
  desc 'Remove expired tokens from the blacklist'
  task remove_expired_tokens: :environment do
    TokenBlacklist.where('expiring_at < ?', Time.zone.now).delete_all
  end
end
