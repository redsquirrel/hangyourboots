class CommitmentsController < ApplicationController
  respond_to :html

  def create
    if current_user.commitment.present?
      flash[:alert] = "You've already committed to a house"
    else
      current_user.build_commitment(:house_id => params[:id])
      if current_user.save
        flash[:notice] = "Successfully joined a house"
        notify_users!
        respond_with(current_user.house)
      else
        flash[:alert] = "Unable to join house"
        render house_path(params[:id])
      end
    end
  end

  def destroy
    if current_user.house.full?
      flash[:alert] = "Your housing is already planned."
      redirect_to current_user.house
    else
      current_user.commitment.destroy
      flash[:alert] = "You are no longer committed to a house"
      redirect_to houses_path
    end
  end

  def update
    current_user.commitment.update_attributes(params[:commitment])
    respond_with(current_user.house)
  end


  private
  def notify_users!
    UserMailer.house_is_full_email! if current_user.house.full?
  end
end
