class StaticController < ApplicationController
  def index
    if !user_signed_in?
      @nomenu = true
    else
      @activities = PublicActivity::Activity.all.paginate(page: params[:page])
    end
  end
end
