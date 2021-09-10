class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])
    if !@follow = Follow.where(following_id: @user.id, follower_id: current_user.id).first
      @follow = Follow.new
    end
    @tables = @user.tables.paginate(page: params[:page])
  end
end
