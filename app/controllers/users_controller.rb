class UsersController < ApplicationController

  respond_to :html

  # Only allow users or admins to edit, update, destroy accounts
  before_filter :authorize_user, :only => [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    respond_with(@user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def authorize_user
    redirect_to root_url unless current_user == @user || current_user.is_admin?
  end
end
