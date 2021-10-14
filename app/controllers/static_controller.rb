class StaticController < ApplicationController
  def index
    if !user_signed_in?
      @nomenu = true
    else
      @activities = current_user.activity_feed.paginate(page: params[:page])
    end
  end
end
