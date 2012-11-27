class UsersController < ApplicationController

  respond_to :html

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
  end

  def show
    @user = User.find(params[:id])
  end

end