class ListMembersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    lm = ListMember.new(list_member_params)

    if lm.save!
      
  end
end
