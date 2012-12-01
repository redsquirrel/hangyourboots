class CommitmentsController < ApplicationController
respond_to :html

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
    if current_user.house.full?
      current_user.house.users.each do |user|
        UserMailer.house_confirmation(user).deliver
      end
    end
    redirect_to house_path
  end

  def destroy
    @commitment = current_commitment
    if @commitment.house.full?
      flash[:alert] = "Your housing is already planned."
      redirect_to @commitment.house
    else
      @commitment.destroy
      flash[:alert] = "You are no longer committed to a house"
      redirect_to root_path
    end
  end

  def update
    @commitment = current_commitment
    @commitment.update_attributes(params[:commitment])
    respond_with(@house)
  end


  private

  def current_commitment
    Commitment.find(params[:id])
  end

end