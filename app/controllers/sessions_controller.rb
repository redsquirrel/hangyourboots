class SessionsController < ApplicationController

	after_filter :reset_cookies!

  def create
    if user = User.from_omniauth(env["omniauth.auth"], cookies[:invite_code])
    	session[:user_id] = user.id
    	redirect_to houses_path, notice: "Signed in!"
    else
    	redirect_to root_url, alert: "Please enter a valid invitation code"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "Signed out!"
  end


  private
  def reset_cookies!
  	cookies.delete(:invite_code)
  end
end
