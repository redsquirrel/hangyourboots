class SessionsController < ApplicationController
  def create
    # Use 'raise' to check the information Facebook provides to us in the request
    # raise request.env["omniauth.auth"].to_yaml
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    binding.pry
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
