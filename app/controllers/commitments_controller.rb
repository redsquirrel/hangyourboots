class CommitmentsController < ApplicationController

  def new
    @commitment = Commitment.new
  end

  def create
    current_user.build_commitment(:house_id => params[:id])
    if current_user.save
      flash[:notice] = "Successfully joined a house"
      redirect_to root_url
    else
      flash[:alert] = "Unable to join house"
    end
  end

end