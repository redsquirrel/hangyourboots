class SessionsController < ApplicationController
  def create
    # Use 'raise' to check the information Twitter provides to us in the request
    # raise request.env["omniauth.auth"].to_yaml
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  end
end
