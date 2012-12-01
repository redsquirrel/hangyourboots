class HousesController < ApplicationController

	respond_to :html
  before_filter :authorize_user, :except => [:show, :index]
  before_filter :sign_in

  def index
    @houses = House.all
  end

  def create
    @house = House.create(params[:house])
    respond_with(@house)
  end

	def new
		@house = House.new
	end

	def edit
    @house = current_house
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
		@house.destroy
		redirect_to 'index'
	end

  private
  def current_house
    House.find(params[:id])
  end

  def authorize_user
    unless current_user.is_admin?
      flash[:alert] = "Unauthorized action"
      redirect_to root_url
    end
  end

  def sign_in
    unless current_user
      redirect_to root_url
    end
  end
end
