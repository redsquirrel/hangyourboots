class SessionsController < ApplicationController
  def new
  	# go to invite page
  	if Invitation.valid_code?(params[:invite_code])
  		redirect_to("/auth/facebook")
  	else
  		flash[:notice] = "Invalid invitation code"
  		render 'login/show'
  	end
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
