class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_list, only: [:show]

  def new
    @list = List.new
  end

  def create
    list = current_user.lists.build(list_params)

    if list.save!
      list.create_activity :create, owner: current_user
      redirect_to list
    else
      redirect_to new_list_path
    end
  end

  def show
    if @list.private && @list.user != current_user
      render status: :forbidden
    end
  end

  private
  def list_params
    params.require(:list).permit(:name, :description, :private, table_ids: [])
  end
  
  def set_list
    @list = List.find(params[:id])
  end
end
