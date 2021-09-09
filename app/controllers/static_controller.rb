class StaticController < ApplicationController
  def index
    if !user_signed_in?
      @nomenu = true
    end
  end
end
