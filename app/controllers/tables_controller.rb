class TablesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_table, only: [:show]
  
  def index
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

  private
  def table_params
    params.require(:table).permit(:title, :dice, rows_attributes: [:id, :name, :description, :_destroy])
  end

  def set_table
    @table = Table.find(params[:id])
  end
end
