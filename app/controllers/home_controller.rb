class HomeController < ApplicationController
  def index
    if user_signed_in?
      render 'user_index'
    else
      render 'default_index'
    end
  end
end
