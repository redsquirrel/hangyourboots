class HousesController < ApplicationController

	respond_to :html
	before_filter :get_house, :only => [:update,:destroy,:edit,:show]

	def get_house
		@house = House.find(params[:id])
	end

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
	end

	def show
	end

	def update
		@house.update_attributes(params[:house])
		respond_with(@house)
	end

	def destroy
		@house.destroy
		redirect_to 'index'
	end

end
