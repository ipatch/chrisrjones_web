class UserMailer < ActionMailer::Base
  default from: "no-reply@chrisrjones.com"
  default to: "me@chrisrjones.com"

  def new_message(message)
  	@message = message
  	mail(:subject => "[chrisrjones.com] #{message.subject}")
  end

  def password_reset(user)
  	@user = user
  	mail :to => user.email, :subject => "Password Reset"
  end

  def confirmation(user)
    @user = user
    mail :to => user.email, :subject => "Confirm Account"
  end
end