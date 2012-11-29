class CommitmentsController < ApplicationController

  def new
    commitment = Commitment.new
  end

  def create
    if current_user.commitment
      flash[:alert] = "You've already committed to a house"
    else
      current_user.build_commitment(:house_id => params[:id])
      if current_user.save
        flash[:notice] = "Successfully joined a house"
      else
        flash[:alert] = "Unable to join house"
      end
    end
    redirect_to house_path
  end


end