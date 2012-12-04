class UserMailer < ActionMailer::Base
  default :from => "hangyourbootsapp@gmail.com"

  def house_confirmation!(user)
    email_with_name = "#{user.name} <#{user.email}>"
    mail(:to => email_with_name, :subject => "Your house is complete!")
  end

  def house_is_full_email!
    current_user.roommates.each do |user|
      UserMailer.house_confirmation!(user).deliver
    end
  end
end
