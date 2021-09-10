class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_follow, only: [:destroy]
  
  def create
    follow = Follow.new(
      follower: current_user,
      following_id: follow_params[:following_id]
    )

    if follow.save!
      flash[:success] = "You are now following"
      redirect_to follow.following
    end
  end

  def destroy
    u = @follow.following_id
    @follow.destroy
    flash[:success] = "Unfollowed"
    redirect_to User.find(u)
  end
  
  private
  def follow_params
    params.require(:follow).permit(:following_id)
  end

  def set_follow
    @follow = Follow.find(params[:id])
  end
end
