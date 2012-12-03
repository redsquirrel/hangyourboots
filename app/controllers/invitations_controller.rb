class InvitationsController < ApplicationController
  before_filter :authorize_user

  private
  def authorize_user
    unless current_user && current_user.is_admin?
      flash[:alert] = "Unauthorized action"
      redirect_to root_url
    end
  end
end
