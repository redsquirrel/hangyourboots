class HousesController < ApplicationController
  respond_to :html

  def index
    @houses = House.all
  end

  def create
    @house = House.create(params[:house])
    respond_with(@house)
  end

  def new
  end

  def edit
  end

  def show
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    @house.update_attributes(params[:house])
    respond_with(@house)
  end

  def destroy
  end

end
