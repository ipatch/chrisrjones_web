# frozen_string_literal: true

# represents the mailer for sending emails to users
class UserMailer < ApplicationMailer
  default from: 'no-reply@chrisrjones.com'
  default to: 'me@chrisrjones.com'

  def new_message(message)
    @message = message
    mail(subject: t('user_mailer.new_message.subject', subject: message.subject))
  end

  def password_reset(user)
    @user = user
    mail(to: user.email, subject: t('user_mailer.password_reset.subject'))
  end

  def confirmation(user)
    @user = user
    mail(to: user.email, subject: t('user_mailer.confirmation.subject'))
  end
end
