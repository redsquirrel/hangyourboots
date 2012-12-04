class UserMailer < ActionMailer::Base
  default :from => "hangyourbootsapp@gmail.com"

  def house_is_full_email!(users)
    users.each do |user|
      UserMailer.house_confirmation!(user).deliver
    end
  end

  def house_was_deleted_email!(users)
    users.each do |user|
      UserMailer.house_deletion!(user).deliver
    end
  end

  private
  def house_confirmation!(user)
    email_with_name = "#{user.name} <#{user.email}>"
    mail(:to => email_with_name, :subject => "Your house is complete!")
  end

  def house_deletion!(user)
    email_with_name = "#{user.name} <#{user.email}>"
    mail(:to => email_with_name, :subject => "Your house has been deleted.")
  end
end
