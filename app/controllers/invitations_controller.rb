class InvitationsController < ApplicationController
  respond_to :html
  before_filter :authorize_user

  def show
    @invitation = Invitation.find(params[:id])
  end

  def index
    @invitations = Invitation.all
  end

  def new
    @invitation = Invitation.new
  end

  def edit
    @invitation = Invitation.find(params[:id])
  end

  def update
    @invitation = Invitation.find(params[:id])
    if @invitation.update_attributes(params[:invitation])
      flash[:notice] = "Updated invitation"
      redirect_to invitations_path
    else
      flash[:alert] = "Something went wrong"
      render 'edit'
    end
  end

  def create
    @invitation = Invitation.create(params[:invitation])
    flash[:notice] = "Successfully created invitation"
    respond_with(@invitation)
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    if @invitation.destroy
      flash[:notice] = "Successfully deleted invitation"
      redirect_to invitations_path
    end
  end

  private
  def authorize_user
    unless current_user && current_user.is_admin?
      redirect_to root_url
    end
  end
end
