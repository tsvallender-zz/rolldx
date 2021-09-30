class TablesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_table, only: [:show, :edit, :update, :destroy]
  before_action :table_owner, only: [:edit, :update, :destroy]
  
  def index
    @tables = Table.all.where(:draft => false, :private =>false).order("created_at DESC")
    if (defined? search_params[:terms])
      @searchterms = search_params[:terms]
      @tables = @tables.search(search_params[:terms])
    end
    
    @tables = @tables.paginate(page: params[:page])
  end

  def show
    unless (@table.private || @table.draft) && @table.user != current_user
      @listmember = ListMember.new
    else
      render status: :forbidden
    end
  end

  def new
    @table = Table.new
  end

  def create
    table = current_user.tables.build(table_params)

    if table.save!
      table.create_activity :create, owner: current_user
      redirect_to table
    else
      redirect_to new_table_path
    end
  end

  def edit
  end

  def update
    if @table.update(table_params)
      table.create_activity :update, owner: current_user
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
  def search_params
    params.require(:search).permit(:terms)
  end
  
  def table_params
    params.require(:table).permit(:title, :description, :draft, :private,
                                  rows_attributes: [:id, :num, :name, :description, :_destroy])
  end

  def set_table
    @table = Table.find(params[:id])
  end

  def table_owner
    redirect_to root_path unless current_user = @table.user
  end
end
