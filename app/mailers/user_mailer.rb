class UserMailer < ActionMailer::Base
  default :from => "hangyourbootsapp@gmail.com"

  def house_confirmation(user)
    @user = user
    email_with_name = "#{user.name} <#{user.email}>"
    mail(:to => email_with_name, :subject => "Your house is complete!")
  end

  def join_confirmation(user)
    @user = user
    email_with_name = "#{user.name} <#{user.email}>"
    mail(:to => email_with_name, :subject => "You have joined #{user.house.title}")
  end

  def house_deletion(user)
    @user = user
    email_with_name = "#{user.name} <#{user.email}>"
    mail(:to => email_with_name, :subject => "Your house was deleted.")
  end

end
