class LoginController < ApplicationController
	def show
	end

  def new
  	if Invitation.valid_code?(params[:invite_code])
  		cookies[:invite_code] = params[:invite_code]
  		redirect_to login_path
  	else
  		flash[:alert] = "Invalid invitation code"
  		render :show
  	end
  end
end
