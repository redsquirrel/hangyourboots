class UsersController < ApplicationController

  respond_to :html
  # Only allow users or admins to edit, update, destroy accounts
  before_filter :load_and_authorize_user, :only => [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    respond_with(@user)
  end

  def edit
  end

  def update
    @user.update_attributes(params[:user])
    respond_with(@user)
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def index
    if current_user.is_admin?
      @users = User.all
    else
      @users = User.for_user_cohort(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def load_and_authorize_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user == @user || current_user.is_admin?
  end
end
