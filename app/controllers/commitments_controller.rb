class CommitmentsController < ApplicationController
  respond_to :html

  def create
    if current_user.commitment.present?
      flash[:alert] = "You've already committed to a house"
    else
      current_user.build_commitment(:house_id => params[:id])
      if current_user.save
        flash[:notice] = "Successfully joined a house"
        respond_with(current_user.house)
        notify_users!
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

  private
  def notify_users!
    if current_user.house.full?
      current_user.roommates.each do |user|
        UserMailer.house_confirmation(user).deliver
      end
    else
      UserMailer.join_confirmation(current_user).deliver
    end
  end
end
