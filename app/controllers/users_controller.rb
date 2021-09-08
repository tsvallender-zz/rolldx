class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])
    @tables = @user.tables.paginate(page: params[:page])
  end
end
