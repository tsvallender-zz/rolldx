class StaticController < ApplicationController
  def index
    if !user_signed_in?
      @nomenu = true
    else
      @activities = PublicActivity::Activity.all
    end
  end
end
