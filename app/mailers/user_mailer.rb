class UserMailer < ActionMailer::Base
  default :from => "hangyourbootsapp@gmail.com"

  def house_confirmation(user)
    mail(:to => user.email, :subject => "Your house is complete!")
  end
end