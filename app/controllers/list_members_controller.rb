class ListMembersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    lm = ListMember.new(list_member_params)

    if (!defined? lm.list.id)
      return redirect_to new_list_path(table_id: lm.table_id)
    end
    
    if ListMember.exists?(list_id: lm.list.id, table_id: lm.table.id)
      flash[:alert] = "That table is already on the list"
      return redirect_to lm.list
    end
    
    if lm.save!
      lm.create_activity :create, owner: current_user
      flash[:success] = lm.list.name + " was added to your list"
      redirect_to lm.list
    end
  end

  def destroy
    lm = ListMember.find(params[:id])
    list = lm.list
    lm.destroy
    flash[:success] = "Table removed from list"
    redirect_to list
  end

  private
  def list_member_params
    params.require(:list_member).permit(:list_id, :table_id)
  end
end
