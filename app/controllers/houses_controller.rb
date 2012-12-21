class HousesController < ApplicationController

	respond_to :html
  before_filter :authorize_user, :except => [:show, :index, :new, :create]
  before_filter :sign_in

  def index
    @houses = House.all
  end

  def create
    @house = House.new(params[:house])
    @house.user_id = current_user.id
    if @house.save
      respond_with(@house)
    else
      @house.build_assets
      render 'new'
    end
  end

	def new
		@house = House.new
    @house.build_assets
	end

	def edit
    @house = current_house
    @house.assets.build
	end

	def show
    @house = current_house
    @roommates = @house.users
	end

	def update
    @house = current_house
		@house.update_attributes(params[:house])
		respond_with(@house)
	end

	def destroy
    @house = current_house
    @house.users.each { |user| UserMailer.house_deletion(user).deliver }
    @house.commitments.each { |com| com.destroy }
		@house.destroy

		redirect_to houses_path
	end

  private
  def current_house
    House.find(params[:id])
  end

  def authorize_user
    unless current_user.is_admin? || current_house.user_id == current_user.id
      redirect_to root_url
    end
  end

  def sign_in
    unless current_user
      redirect_to root_url
    end
  end
end
