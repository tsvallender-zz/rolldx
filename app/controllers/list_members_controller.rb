class ListMembersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    lm = ListMember.new(list_member_params)

    if lm.save!
      lm.create_activity :create, owner: current_user
      flash[:success] = lm.list.name + " was added to your list"
      redirect_to lm.list
    end
  end

  private
  def list_member_params
    params.require(:list_member).permit(:list_id, :table_id)
  end
end
