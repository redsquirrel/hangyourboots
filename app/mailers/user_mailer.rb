class UserMailer < ActionMailer::Base
  default :from => "hangyourbootsapp@gmail.com"

  def house_confirmation(user)
    @user = user
    email_with_name = "#{user.name} <#{user.email}>"
    mail(:to => email_with_name, :subject => "Your house is complete!")
  end

<<<<<<< HEAD
  def house_deletion(user)
    email_with_name = "#{user.name} <#{user.email}>"
    mail(:to => email_with_name, :subject => "Your house has been deleted.")
  end
=======
>>>>>>> 06034792c4460a3daf85875433df347a647c8f1f
end
