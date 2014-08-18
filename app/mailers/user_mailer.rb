class UserMailer < ActionMailer::Base
  default from: "no-reply@chrisrjones.com"
  default to: "me@chrisrjones.com"

  def new_message(message)
  	@message = message
  	mail(:subject => "[chrisrjones.com] #{message.subject}")
  end
end