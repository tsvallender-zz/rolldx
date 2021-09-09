class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_list, only: [:show]

  def new
    @list = List.new
  end

  def create
    list = current_user.lists.build(list_params)

    if list.save!
      redirect_to list
    else
      redirect_to new_list_path
    end
  end

  def show
  end

  private
  def list_params
    params.require(:list).permit(:name, :description)
  end
  
  def set_list
    @list = List.find(params[:id])
  end
end
