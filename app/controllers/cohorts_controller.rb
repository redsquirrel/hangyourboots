class CohortsController < ApplicationController
  respond_to :html
  before_filter :authorize_user

  def show
    @cohort = Cohort.find(params[:id])
  end

  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
    @cohort = Cohort.find(params[:id])
    if @cohort.update_attributes(params[:cohort])
      flash[:notice] = "Updated cohort"
      redirect_to cohorts_path
    else
      flash[:alert] = "Something went wrong"
      render 'edit'
    end
  end

  def create
    @cohort = Cohort.create(params[:cohort])
    flash[:notice] = "Successfully created cohort"
    respond_with(@cohort)
  end

  def destroy
    @cohort = Cohort.find(params[:id])
    if @cohort.destroy
      flash[:notice] = "Successfully deleted cohort"
      redirect_to cohorts_path
    end
  end

  private
  def authorize_user
    unless current_user && current_user.is_admin?
      redirect_to root_url
    end
  end
end
