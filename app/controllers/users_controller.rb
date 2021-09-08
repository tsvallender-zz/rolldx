class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tables = @user.tables.paginate(page: params[:page])
  end
end
