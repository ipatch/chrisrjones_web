# frozen_string_literal: true

class User < ApplicationRecord # :nodoc:
  before_create { generate_token(:confirmation_token) }
  has_secure_password # req, bcrypt gem

  # NOTE: source = http://railscasts.com/episodes/274-remember-me-reset-password
  # NOTE: the below line was causing an error in rails 4.2.0
  # before_create { generate_token(:auth_token) }
  # NOTE: the below line won't work with rails 4.x
  # attr_accessible :email, :password, :password_confirmation

  has_many :articles, dependent: :destroy
  has_many :attachments, dependent: :nullify

  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true

  def generate_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break unless User.exists?(column => self[column])
    end
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver_now
  end

  def send_confirmation
    generate_token(:confirmation_token)
    self.confirmation_sent_at = Time.zone.now
    save!
    UserMailer.confirmation(self).deliver_now
  end
end
