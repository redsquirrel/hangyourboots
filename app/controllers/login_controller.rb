class LoginController < ApplicationController

  layout "login"

	def show
	end

  def new
  	# User wants to join
  	code = params[:invite_code]
  	if Invitation.valid_code?(code)
  		cookies[:invite_code] = code
  		redirect_to("/auth/facebook")
  	else
  		flash[:alert] = "Invalid invitation code"
  		render 'login/show'
  	end
  end
end
