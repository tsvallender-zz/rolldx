class TablesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_table, only: [:show, :edit, :update, :destroy]
  before_action :table_owner, only: [:edit, :update, :destroy]
  
  def index
    @tables = Table.all.paginate(page: params[:page])
  end

  def show
  end

  def new
    @table = Table.new
  end

  def create
    table = current_user.tables.build(table_params)

    if table.save!
      redirect_to table
    else
      redirect_to new_table_path
    end
  end

  def edit
  end

  def update
    if @table.update(table_params)
      flash[:success] = "Table updated!"
      redirect_to @table
    else
      render 'edit'
    end
  end

  def destroy
    @table.destroy
    flash[:success] = "Table deleted"
    redirect_to tables_path
  end
  
  private
  def table_params
    params.require(:table).permit(:title, rows_attributes: [:id, :name, :description, :_destroy])
  end

  def set_table
    @table = Table.find(params[:id])
  end

  def table_owner
    redirect_to root_path unless current_user = @table.user
  end
end
